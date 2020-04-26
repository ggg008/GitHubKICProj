package Crawler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import modelPaging.CandlestickTO;
import modelPaging.ChartListInfoTOTemp;
import modelPaging.MasDAO;

public class ChartDataCollector
{	
	//조회 목록
	ArrayList<ChartListInfoTOTemp> restAPIs = new ArrayList<>();
	
	//시간관련
	long myTimeWeight = 4; //갱신 시간이 늦어서 추가
	long utcWeight = -2 + myTimeWeight;//utc 시간보정	
	String[] timeKeys = {"minute", "hour", "day"};	
	HashMap<String, Long> timeUnits = new HashMap<String, Long>();	
	HashMap<String, Long> standardTimes = new HashMap<String, Long>();
	HashMap<String, Long> updateTimes = new HashMap<String, Long>();	
	long now = 0;
	
	//
	String dirName = ".."+ File.separator +"crawlerLocalData";	
	
	MasDAO masDAO = null;
	
	HashMap<String, Double> lastPrices = new HashMap<>();

	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final Path WEB_DRIVER_PATH = Paths.get(System.getProperty("user.dir"), "WEB-INF"+ File.separator +"chromedriver.exe");

	Path diverPath = null;
	
	ArrayList<RunnableCrawlingSelenium> crawlingList = new ArrayList<>();
	
	ArrayList<DriverMaster> driverMasters = new ArrayList<>();
	int houwManyDriver = 1;
	int count = 0;
	
	public ChartDataCollector()
	{
		ChartListInfoTOTemp crTo = new ChartListInfoTOTemp();
		crTo.setFromSymbol("BTC");
		crTo.setToSymbol("USD");
		
		restAPIs.add(crTo);
		
		
		
		//시간 초기화
		timeUnits.put("minute", Integer.toUnsignedLong(60));
		timeUnits.put("hour", Integer.toUnsignedLong(60 * 60));
		timeUnits.put("day", Integer.toUnsignedLong(60 * 60 * 24));
		
		now = System.currentTimeMillis() / 1000 + utcWeight;		
		for(int i = 0; i < timeKeys.length; ++i) {
			String key = timeKeys[i];
			
			standardTimes.put(key, now - (now % timeUnits.get(key)));
			updateTimes.put(key, standardTimes.get(key) + timeUnits.get(key));		
			System.out.printf("-키값 : %s %d %d \n", key, standardTimes.get(key), updateTimes.get(key) );	
		}
		
		
		
		
				
		masDAO = new MasDAO();
		System.out.println("-전체 데이터 카운트 : " + masDAO.countCandelstick(null));
		// 차트 데이터 없을 경우..
		for(ChartListInfoTOTemp cliTo : restAPIs ) {
//			System.out.print("ChartRange : " + cliTo.getFromSymbol() + cliTo.getToSymbol() + "-");
//			System.out.println(masDAO.countCandelstick(cliTo));
			
			CandlestickTO lastDayCTo = new CandlestickTO();
			lastDayCTo.setCandleKey(cliTo.getFromSymbol() + cliTo.getToSymbol() + "day" + standardTimes.get("day"));
			
			lastDayCTo = masDAO.getCandlestick(lastDayCTo);//데이터가 없거나 차이가 하루이상 날경우
			if(lastDayCTo.getCandleJSON() == null) {
				for(String histoKey  : timeKeys) {									
					
					System.out.println("※차트 데이터 전체 갱신 수행※");
					setBasicChartJSON(cliTo, histoKey);
				}				
			}
			
		}
		/*
		  */
		
		try {
			System.out.println("-실행환경 : " + System.getProperty("os.name"));
			if(System.getProperty("os.name").contains("Win")) {
				Runtime.getRuntime().exec("taskkill /F /IM chromedriver.exe /T");	
				
				String tomcatPath = System.getProperty("catalina.base");
				diverPath = WEB_DRIVER_PATH;
				if(tomcatPath != null) {
					String webapps = tomcatPath.contains("org.eclipse.wst.server.core") ? "wtpwebapps" : "webapps";
					
					diverPath = Paths.get(tomcatPath, webapps, "MasChartProject", "WEB-INF", "chromedriver.exe");
				}
			}
			else {
				Runtime.getRuntime().exec("killall chromedriver.exe");
				diverPath = Paths.get("..", "..", "usr","bin","chromedriver");
			}
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		
		

		System.out.println("-크롬 드라이버 경로 : " + diverPath);
		// System Property SetUp
		System.setProperty(WEB_DRIVER_ID, diverPath.toString());
		for(int i = 0; i < houwManyDriver; ++i) {
			driverMasters.add(new DriverMaster());
		}
		
		
	
		
		// 인터벌 쓰레드
		final long timeInterval = 10000;
		Runnable runnableInterval = new Runnable() {
			public void run()
			{
				while (true) {
					// ------- code for task to run
					//System.out.println("Hello !!");
					now = System.currentTimeMillis() / 1000 + utcWeight;
					
					
					for(int i = 0; i < timeKeys.length; ++i) {
						String tk = timeKeys[i];
						
						long sec = now - standardTimes.get(tk);
						
						if(tk.equals("minute")) {
							long remainTime = timeUnits.get(tk) - sec;	
//							System.out.println("째깍 : " + remainTime);
						}

						//System.out.println("째깍 : ?");
						
						//기준시 갱신
						if(updateTimes.get(tk) <= standardTimes.get(tk) + sec) {
							standardTimes.put(tk, now - (now % timeUnits.get(tk)));
							updateTimes.put(tk, standardTimes.get(tk) + timeUnits.get(tk));
					        
							System.out.println("-서버 인터벌 새로운 기준 "+ tk + " : " + standardTimes.get(tk) + " / " + updateTimes.get(tk));
							
							switch (tk) {
							case "minute":								
							case "hour":
								if(!standardTimes.get(tk).equals(updateTimes.get("day"))) {
																		
									for(ChartListInfoTOTemp cliTo : restAPIs) {
										if(lastPrices.containsKey(cliTo.getFromSymbol() + cliTo.getToSymbol())) {
											double lastPrice = lastPrices.get(cliTo.getFromSymbol() + cliTo.getToSymbol());
											String newCandleKey = cliTo.getFromSymbol() + cliTo.getToSymbol() + tk + standardTimes.get(tk); 
											String newCandleJson = String.format(
													"{\"high\":%.2f,\"low\":%.2f,\"conversionSymbol\":\"\",\"volumeto\":%s,\"volumefrom\":%s,\"time\":%d,\"conversionType\":\"direct\",\"close\":%.2f,\"open\":%.2f}", 
													lastPrice, lastPrice, "0", "0", standardTimes.get(tk), lastPrice, lastPrice);
											CandlestickTO cTo = new CandlestickTO();
											cTo.setCandleKey(newCandleKey);
											cTo.setCandleJSON(newCandleJson);
											
											masDAO.setCandlestick(cTo);
											
											System.out.println("-새로운 캔들 인터벌에서 삽입 : " + cTo.getCandleKey() + " : " + cTo.getCandleJSON());
										}
										
									}
								}
								break;
							case "day":
								//차트 데이터 동기화 - 하루에 한번씩
								for(ChartListInfoTOTemp chartRangeTO : restAPIs) {
									for(String histoKey  : timeKeys) {										
										setBasicChartJSON(chartRangeTO, histoKey);
									}
								}
								break;

							default:
								break;
							}
						}
					}
//					RunnableCrawlingSelenium target = new RunnableCrawlingSelenium(standardTimes);
//					
//					Thread thread = new Thread(target);
//					thread.start();
					
					if(driverMasters.size() <= count ) {
						count = 0;
						System.out.println("-카운트 다시 0");
					}
					
					driverMasters.get(count).workDriver(standardTimes);
					
//					crawlingList.add(target);
//					
//					while(5 < crawlingList.size()) {
//						RunnableCrawlingSelenium runnable = crawlingList.get(0);
//						if(runnable != null) {
//							System.out.println("★ 강제 퇴거 실행!");
//							crawlingList.get(0).stopCrawling();
//						}
//					}

					
					// ------- ends here
					try {
						long ti = now * 1000 % timeInterval != 0 ? timeInterval - (now * 1000 % timeInterval) : timeInterval;
//						System.out.println(now * 1000 % timeInterval != 0 ? now * 1000 % timeInterval : timeInterval);
						System.out.printf("[now : %d] [now / ti : %d] [ti : %d]\n",  now * 1000, now * 1000 % timeInterval, ti);
						
						++count;
						Thread.sleep(ti);
						
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}

			
		};
		Thread thread = new Thread(runnableInterval);
		thread.start();		
		
//		writeLog("머시기");
//		testJsonParse();
	}

	private void setBasicChartJSON(ChartListInfoTOTemp chartListTO, String histoKey)
	{	
		Thread thread = new Thread(new Runnable() {
			
			@Override
			public void run()
			{
				System.out.println("-차트 데이터 셋 " + chartListTO.getFromSymbol() + chartListTO.getToSymbol() + histoKey);
				
				// TODO Auto-generated method stub
				String getJSONUrl = "https://min-api.cryptocompare.com/data/v2/histo"+histoKey+"?fsym="+ chartListTO.getFromSymbol() +"&tsym="+ chartListTO.getToSymbol() +"&limit=2000";								
				StringBuffer jsonStr = new StringBuffer();
				try {
					String json = Jsoup.connect(getJSONUrl)
							.ignoreContentType(true).execute().body();
					
					jsonStr.append(json);
					
		            JSONObject jsonObj = (JSONObject) new JSONParser().parse(jsonStr.toString());
		            JSONArray datasindata = (JSONArray)((JSONObject) jsonObj.get("Data")).get("Data");
		            
		            ArrayList<CandlestickTO> candlestickTOs = new ArrayList<>();
		            
		        	for(int i=0 ; i<datasindata.size() ; i++){
		                JSONObject tempObj = (JSONObject) datasindata.get(i);
		                
	                	CandlestickTO candlestickTO = new CandlestickTO();
	                	
	                	String key = chartListTO.getFromSymbol() + chartListTO.getToSymbol() + histoKey + tempObj.get("time");
	                	candlestickTO.setCandleKey(key);
	                	candlestickTO.setCandleJSON(tempObj.toJSONString());
	                	
//		                System.out.println(tempObj.toJSONString());
	                	candlestickTOs.add(candlestickTO);
		            }
		        	masDAO.setCandlestickBulk(candlestickTOs);
					
				} catch (IOException | ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
//				System.out.println(jsonStr);
			}
		});
		thread.start();		
	}
	
	
	
	private void writeLog(String data)
	{
		BufferedWriter bw = null;

		long now = System.currentTimeMillis() / 1000 + utcWeight;
		try {
			File file = new File(dirName);
			file.mkdirs();
			
			bw = new BufferedWriter(new FileWriter(dirName + File.separator + "crawlingLog_" + now + ".html"));
			
			bw.write(data);
			
			System.out.println("출력 완료");
			
		} catch (IOException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			if(bw != null)
				try { bw.close();} catch (IOException e) {}			
		}
	}
	
	private void setterCrawlingLastPrice(String fsym, String fsymPrice, HashMap<String, Long> crawlerStandardTimes)
	{		
		for(ChartListInfoTOTemp cliTo : restAPIs) {
			if(cliTo.getFromSymbol().equals(fsym)) {
				
				double lastPrice = Double.valueOf(fsymPrice.replaceAll("^\\D", "").replaceAll(",", "").trim());
//								System.out.println(chartListTO.getFromSymbol() + " : " + price);
				
				lastPrices.put(cliTo.getFromSymbol() + cliTo.getToSymbol(), lastPrice);
				
				for(String timekey : timeKeys ) {
					CandlestickTO lastCandlestickTO = new CandlestickTO();
					
					lastCandlestickTO.setCandleKey(cliTo.getFromSymbol()+cliTo.getToSymbol()+timekey+crawlerStandardTimes.get(timekey));//standardTime.get(timekey));							
					lastCandlestickTO = masDAO.getCandlestick(lastCandlestickTO);
					
					
					if(lastCandlestickTO.getCandleJSON() == null) {	
//						System.out.println("-없는캔들 : " + cliTo.getFromSymbol()+cliTo.getToSymbol()+timekey+crawlerStandardTimes.get(timekey));
						
						String newCandleJson = String.format(
								"{\"high\":%.2f,\"low\":%.2f,\"conversionSymbol\":\"\",\"volumeto\":%s,\"volumefrom\":%s,\"time\":%d,\"conversionType\":\"direct\",\"close\":%.2f,\"open\":%.2f}", 
								lastPrice, lastPrice, "0", "0", standardTimes.get(timekey), lastPrice, lastPrice);
						
						lastCandlestickTO.setCandleJSON(newCandleJson);
						
						masDAO.setCandlestick(lastCandlestickTO);
						
						System.out.println("-새로운 캔들 크라울러에서 삽입 : " + lastCandlestickTO.getCandleKey() + " : " + lastCandlestickTO.getCandleJSON());
						
					}
					
					try {
						JSONObject jsonObj = (JSONObject) new JSONParser().parse(lastCandlestickTO.getCandleJSON());
//											JSONArray datasindata = (JSONArray)((JSONObject) jsonObj.get("Data")).get("Data");
						
//								System.out.println(jsonObj.toJSONString());
						
						double high = Double.parseDouble(jsonObj.get("high").toString());
						double low = Double.parseDouble(jsonObj.get("low").toString());
						
//											System.out.printf("%.2f, %.2f ,%.2f \n", close, high, low);
						
						if(high < lastPrice) {
							high = lastPrice;
						} else if (lastPrice < low) {
							low = lastPrice;
						}
						String candleJSON = String.format(
								"{\"high\":%.2f,\"low\":%.2f,\"conversionSymbol\":\"\",\"volumeto\":%s,\"volumefrom\":%s,\"time\":%d,\"conversionType\":\"direct\",\"close\":%.2f,\"open\":%.2f}", 
								high, low, jsonObj.get("volumeto").toString(), jsonObj.get("volumefrom").toString(), crawlerStandardTimes.get(timekey), lastPrice, Double.parseDouble(jsonObj.get("open").toString()));
						lastCandlestickTO.setCandleJSON(candleJSON);
						
						masDAO.setCandlestick(lastCandlestickTO);
						
						
						//System.out.println("-마지막 캔들 정보 : " + lastCandlestickTO.getCandleKey() + " : " + lastCandlestickTO.getCandleJSON());
						
						if(timekey.equals("minute")) {
							System.out.println("-현재 " + cliTo.getFromSymbol() + cliTo.getToSymbol() + " 가격 : " + lastPrice);
						}
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
		}
	}
	

	// 클라울링 쓰레드
	class RunnableCrawlingJsoup implements Runnable 
	{
		
		HashMap<String, Long> crawlerStandardTimes;
		
		public RunnableCrawlingJsoup(HashMap<String, Long> standardTimes)
		{
			// TODO Auto-generated constructor stub
			this.crawlerStandardTimes = standardTimes;
		}
		
		@Override
		public void run()
		{
			// TODO Auto-generated method stub
			String parseUrl = "https://www.coingecko.com/";
			String selectorCMC = ".cmc-table-row";
			String selectorGecko = "div.sort, .table, .mb-0 tbody tr";
			Document document = null;
			try {
				document = Jsoup.connect(parseUrl).get();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//							System.out.println(document);
//							writeLog(document.toString());
			
			Elements titles = document.select(selectorGecko);
			
			
			for (int i = 0; i < titles.size(); ++i) { // -- 3. Elemntes 길이만큼 반복한다.
				Element element = titles.get(i);
				if (i == 0)
					continue;

//								System.out.println(element.text()); // -- 4. 원하는 요소가 출력된다.
				String[] strElt = element.text().split(" ");
//								System.out.printf("%s-%s-%s-%s-%s\n", strElt[0], strElt[1], strElt[2], strElt[3], strElt[4]);
				
				String fsym = strElt[2];
				String fsymPrice = strElt[4];
				
				setterCrawlingLastPrice(fsym, fsymPrice, crawlerStandardTimes);
			}
			
		}

	}
	
	// 클라울링 쓰레드 셀레니움
	class RunnableCrawlingSelenium implements Runnable 
	{
		//셀리니움 웹드라이버
		private WebDriver driver;
		
		HashMap<String, Long> crawlerStandardTimes;
		
		public RunnableCrawlingSelenium(HashMap<String, Long> standardTimes, WebDriver driver)
		{
			// TODO Auto-generated constructor stub
			this.crawlerStandardTimes = standardTimes;
			this.driver = driver;

//			ChromeOptions options = new ChromeOptions();
//	        options.addArguments("--start-maximized");          // 최대크기로
//	        options.addArguments("--headless");                 // Browser를 띄우지 않음
//	        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
//	        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
//	        options.addArguments("--log-level=3");
//	        options.addArguments("--disable-logging");
//	        options.addArguments("--disable-dev-shm-usage"); // overcome limited resource problems
//	        options.addArguments("disable-infobars"); // disabling infobars
//	        options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
//	        options.addArguments("lang=en_US");
//			
//	        // Driver SetUp
//	 		driver = new ChromeDriver(options);
	 		
		}
		
		@Override
		public void run()
		{
			String url1 = "https://intoli.com/blog/making-chrome-headless-undetectable/chrome-headless-test.html";
			String url2 = "http://luka7.net/";
			String url3 = "https://www.cryptocompare.com/coins/list/USD/1";
			
			String parseUrl = url3;

			String selectorGecko = "div.sort, .table, .mb-0 tbody tr";
			String selectorCC = "tr[ng-repeat=(keyCoinData,coinData) in getCoinArray()]";
			Document document = null;
			
			// TODO Auto-generated method stub
			try {
				
				System.out.println(this.getClass()+ "쓰레드 진입");
				
				driver.get(parseUrl);
				
				WebDriverWait wait = new WebDriverWait(driver, 10);
				wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("a[ng-href='/coins/btc/overview/USD']")));
				
				document = Jsoup.parse(driver.getPageSource());
				
				if(!System.getProperty("os.name").contains("Win")) {
					testerMain.writeLog(this.getClass().getName(), driver.getPageSource(), "html");					
				}
				
				Elements titles = document.select(selectorCC);
				
				System.out.println(this.getClass()+ "쓰레드 파싱");
				
				for (int i = 0; i < titles.size(); ++i) {

					String fsym = "";
					String fsymPrice = "";
					
					Elements split = titles.get(i).select("td");
					for(int j = 0; j < split.size(); ++j) {
						
						if(j == 2) {
							String[] strSym = split.get(j).text().split(" ");
							fsym = strSym[strSym.length - 1];
						} else if (j == 3) {						
							fsymPrice = split.get(j).text();
						}
						
//						System.out.println("☆" + split.get(j).text());
						
					}					
//					System.out.println(fsym + " : " + fsymPrice);
					
					setterCrawlingLastPrice(fsym, fsymPrice, crawlerStandardTimes);
					
				}
				
				if(titles.size() <= 0) {
					testerMain.writeLog("Fail_" + this.getClass().getName(), driver.getPageSource(), "html");
					System.out.println("-셀레니움 실패 : titlesize " + titles.size());					
				}
				Thread.sleep(1000);
			} catch ( TimeoutException e ) {
	            System.out.println("-목록을 찾을 수 없습니다.");
			} catch ( InterruptedException e) {
				e.printStackTrace();
			} catch (Exception e) {

				e.printStackTrace();

			} finally {				
//				driver.close();
//				driver = null;
				System.out.println("쓰레드 종료");
			}
		}
	}
	
	
	class DriverMaster 
	{
		//셀리니움 웹드라이버
		private WebDriver driver;
		
		Thread crawlingThread;
		RunnableCrawlingSelenium runnableSelenum;
		
		public DriverMaster()
		{
			ChromeOptions options = new ChromeOptions();
	        options.addArguments("--start-maximized");          // 최대크기로
	        options.addArguments("--headless");                 // Browser를 띄우지 않음
	        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
	        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
	        options.addArguments("--log-level=3");
	        options.addArguments("--disable-logging");
//	        options.addArguments("--disable-dev-shm-usage"); // overcome limited resource problems
	        options.addArguments("disable-infobars"); // disabling infobars
	        options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
	        options.addArguments("lang=en_US");
	        
//	        ChromeDriverService chromeDriverService = ChromeDriverService.createDefaultService();
//	        chromeDriverService.
	        
//	        Chrom 
//	        chromeDriverService = ChromeDriverService.CreateDefaultService();
//	        chromeDriverService.HideCommandPromptWindow = true;
			
	        // Driver SetUp
	 		driver = new ChromeDriver(options);
		}

		public void workDriver(HashMap<String, Long> standardTimes)
		{	
			runnableSelenum = new RunnableCrawlingSelenium(standardTimes, this.driver);
			
			if(this.crawlingThread != null) {
				this.crawlingThread.interrupt();
				System.out.println("Thread state : " +  this.crawlingThread.getState() );
				this.crawlingThread = null;				
			}
			this.crawlingThread = new Thread(runnableSelenum);
			this.crawlingThread.start();
		}
		
		@Override
		protected void finalize() throws Throwable
		{
			// TODO Auto-generated method stub
			super.finalize();
			driver.quit();
		}
		
	}
}

