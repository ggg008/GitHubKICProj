package Crawler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SeleniumTest
{	
	public static void main(String[] args)
	{
		SeleniumTest seleniumTest = new SeleniumTest();
	}
	
	//시간관련
	long utcWeight = -2;//utc 시간보정	
	String[] timeKeys = {"minute", "hour", "day"};	
	HashMap<String, Long> timeUnits = new HashMap<String, Long>();	
	HashMap<String, Long> standardTimes = new HashMap<String, Long>();
	HashMap<String, Long> updateTimes = new HashMap<String, Long>();	
	long now = 0;

	// WebDriver
	private WebDriver driver;

	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final Path WEB_DRIVER_PATH = Paths.get(System.getProperty("user.dir"), "WebContent", "WEB-INF", "chromedriver.exe");

	Path diverPath = null;
	
	// 크롤링 할 URL
	private String base_url;

	public SeleniumTest()
	{
		super();

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

		ChromeOptions options = new ChromeOptions();
        options.addArguments("--start-maximized");          // 최대크기로
        options.addArguments("--headless");                 // Browser를 띄우지 않음
        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
        options.addArguments("lang=en_US");
//        options.setPageLoadStrategy(PageLoadStrategy.NONE);
//        options.addArguments("plugins-length=3");
        
		
		// Driver SetUp
		driver = new ChromeDriver(options);
		base_url = "https://intoli.com/blog/making-chrome-headless-undetectable/chrome-headless-test.html";
//		driver.get("about:blank");
//		JavascriptExecutor js = (JavascriptExecutor)driver;
//		js.executeScript("alert('ddd');");
//		js.executeScript("Object.defineProperty(navigator, 'plugins', {get: function() {return[1, 2, 3, 4, 5];},});");
		
//		js.executeScript("window.onload = function() {\r\n" + 
//				"		document.getElementsByTagName('body')[0].innerHTML += '<a> 시발 </a>';\r\n" + 
//				"	}");
		
				
		crawl();
		
//		Thread thread = new Thread(new RunnableCrawlingSelenium(standardTimes));
//		thread.start();
		
	}

	public void crawl()
	{
		String url1 = "https://intoli.com/blog/making-chrome-headless-undetectable/chrome-headless-test.html";
		String url2 = "http://luka7.net/";
		String url3 = "https://www.cryptocompare.com/coins/list/USD/1";
		
		String parseUrl = url1;
		
		
		try {
			
			//driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
			
//			WebDriverWait wait = new WebDriverWait(driver, 30);
//            WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.tagName("div"))); //By.cssSelector("#text-tool-caret")));
            
//            List<WebElement> contents = parent.findElements(By.cssSelector("div.css-1dbjc4n.r-my5ep6.r-qklmqi.r-1adg3ll"));
//            System.out.println( "조회된 콘텐츠 수 : "+contents.size() );
            
			// get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
			driver.get(parseUrl);
			
			
			
			System.out.println(driver.getPageSource());
			
			
			
			testerMain.writeLog(this.getClass().getName(), driver.getPageSource() , "html");
		} catch ( TimeoutException e ) {
            System.out.println("목록을 찾을 수 없습니다.");
		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			driver.close();
		}

	}
	
	// 클라울링 쓰레드 셀레니움
	class RunnableCrawlingSelenium implements Runnable 
	{
		HashMap<String, Long> crawlerStandardTimes;
		
		public RunnableCrawlingSelenium(HashMap<String, Long> standardTimes)
		{
			// TODO Auto-generated constructor stub
			this.crawlerStandardTimes = standardTimes;
		}
		
		@Override
		public void run()
		{
//			class="coins-list"
//			WebDriverWait wait = new WebDriverWait(driver, 30);
//			wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("webPageCoinListH")));
			
			String url1 = "https://intoli.com/blog/making-chrome-headless-undetectable/chrome-headless-test.html";
			String url2 = "http://luka7.net/";
			String url3 = "https://www.cryptocompare.com/coins/list/USD/1";
			
			String parseUrl = url3;

			String selectorGecko = "div.sort, .table, .mb-0 tbody tr";
			String selectorCC = "tr[ng-repeat=(keyCoinData,coinData) in getCoinArray()]";
			Document document = null;
			
			// TODO Auto-generated method stub
			try {
				
				driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
				
				driver.get(parseUrl);
				
				WebDriverWait wait = new WebDriverWait(driver, 30);
				wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("a[ng-href='/coins/btc/overview/USD']")));
				
				
				testerMain.writeLog(this.getClass().getName(), driver.getPageSource(), "html");
				
				document = Jsoup.parse(driver.getPageSource());
				
				testerMain.writeLog(this.getClass().getName() + "2", document.toString(), "html");
				
				Elements titles = document.select(selectorCC);
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
					System.out.println(fsym + " : " + fsymPrice);
					
				}
				System.out.println("-셀레니움 성공 : titlesize " + titles.size());
			} catch ( TimeoutException e ) {
	            System.out.println("-목록을 찾을 수 없습니다.");
			} catch (Exception e) {

				e.printStackTrace();

			} finally {

				driver.close();
			}
		}
	}

}
