package Crawler;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.Console;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import modelPaging.CandlestickTO;
import modelPaging.ChartListInfoTOTemp;
import modelPaging.MasDAO;

public class ChartDataCollector
{	
	//조회 목록
	ArrayList<ChartListInfoTOTemp> restAPIs = new ArrayList<>();
	long utcWeight = -2;//utc 시간보정	
	String[] timeKeys = {"minute", "hour", "day"};
	
	HashMap<String, Long> timeUnits = new HashMap<String, Long>();
	
	HashMap<String, Long> standardTimes = new HashMap<String, Long>();
	HashMap<String, Long> updateTimes = new HashMap<String, Long>();
	
	long now = 0;
	String dirName = ".."+ File.separator +"crawlerLocalData";	
	
	MasDAO masDAO = null;
	
	HashMap<String, Double> lastPrices = new HashMap<>();
	
	public ChartDataCollector()
	{
		ChartListInfoTOTemp crTo = new ChartListInfoTOTemp();
		crTo.setFromSymbol("BTC");
		crTo.setToSymbol("USD");
		
		restAPIs.add(crTo);
		
		
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
		
		// TODO Auto-generated constructor stub

		
		
				
		masDAO = new MasDAO();
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
		
	
		
		// 인터벌 쓰레드
		final long timeInterval = 5000;
		Runnable runnable = new Runnable() {
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
										double lastPrice = lastPrices.get(cliTo.getFromSymbol() + cliTo.getToSymbol());
										String newCandleKey = cliTo.getFromSymbol() + cliTo.getToSymbol() + tk + standardTimes.get(tk); 
										String newCandleJson = String.format(
												"{\"high\":%.2f,\"low\":%.2f,\"conversionSymbol\":\"\",\"volumeto\":%s,\"volumefrom\":%s,\"time\":%d,\"conversionType\":\"direct\",\"close\":%.2f,\"open\":%.2f}", 
												lastPrice, lastPrice, "0", "0", standardTimes.get(tk), lastPrice, lastPrice);
										CandlestickTO cTo = new CandlestickTO();
										cTo.setCandleKey(newCandleKey);
										cTo.setCandleJSON(newCandleJson);
										
										masDAO.setCandlestick(cTo);
										
										System.out.println("-새로운 캔들 삽입 : " + cTo.getCandleKey() + " : " + cTo.getCandleJSON());
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
					Thread thread = new Thread(new RunnableCrawling(standardTimes));
					thread.start();

					
					// ------- ends here
					try {
						long ti = now * 1000 % timeInterval != 0 ? timeInterval - (now * 1000 % timeInterval) : timeInterval;
//						System.out.println(now * 1000 % timeInterval != 0 ? now * 1000 % timeInterval : timeInterval);
//						System.out.printf("[now : %d] [now / ti : %d] [ti : %d]\n",  now * 1000, now * 1000 % timeInterval, ti);
						Thread.sleep(ti);
						
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}

			
		};
		Thread thread = new Thread(runnable);
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
	
	private void testJsonParse() {
		// TODO Auto-generated method stub
		BufferedReader br = null;
		StringBuffer jsonStr = new StringBuffer();
		
		try {
			br = new BufferedReader(new FileReader(dirName + File.separator + "testJson.TXT"));
			
			String dataString = null;
			while((dataString = br.readLine()) != null ) {
				jsonStr.append(dataString);
			}
			
			JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonStr.toString());
            JSONArray datas = (JSONArray)((JSONObject) jsonObj.get("Data")).get("Data");
            JSONArray datasindata = (JSONArray)((JSONObject) jsonObj.get("Data")).get("Data");

            System.out.println("=====Test=====");
            
            ArrayList<CandlestickTO> candlestickTOs = new ArrayList<>();
            
        	for(int i=0 ; i<datasindata.size() ; i++){
                JSONObject tempObj = (JSONObject) datasindata.get(i);
                if(i <= 10) {
                	CandlestickTO candlestickTO = new CandlestickTO();
                	
                	String key = "BTCUSDminute" + tempObj.get("time");
                	candlestickTO.setCandleKey(key);
                	candlestickTO.setCandleJSON(tempObj.toJSONString());
                	
                	candlestickTOs.add(candlestickTO);
                }
                System.out.println(tempObj.toJSONString());
            }
        	
        	masDAO.setCandlestickBulk(candlestickTOs);
			
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		System.out.println(jsonStr);
		
		
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
	
	// 클라울링 쓰레드
	class RunnableCrawling implements Runnable {
		
		HashMap<String, Long> crawlerStandardTimes;
		
		public RunnableCrawling(HashMap<String, Long> standardTimes)
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
				for(ChartListInfoTOTemp cliTo : restAPIs) {
					if(cliTo.getFromSymbol().equals(strElt[2])) {
						
						double lastPrice = Double.valueOf(strElt[4].substring(1, strElt[4].length()).replace(",", ""));
//								System.out.println(chartListTO.getFromSymbol() + " : " + price);
						
						lastPrices.put(cliTo.getFromSymbol() + cliTo.getToSymbol(), lastPrice);
													
						for(String timekey : timeKeys ) {
							CandlestickTO lastCandlestickTO = new CandlestickTO();
							
							lastCandlestickTO.setCandleKey(cliTo.getFromSymbol()+cliTo.getToSymbol()+timekey+crawlerStandardTimes.get(timekey));//standardTime.get(timekey));							
							lastCandlestickTO = masDAO.getCandlestick(lastCandlestickTO);
							
							
							if(lastCandlestickTO.getCandleJSON() == null) {										
								continue;
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
								
								System.out.println("-마지막 캔들 정보 : " + lastCandlestickTO.getCandleKey() + " : " + lastCandlestickTO.getCandleJSON());
								
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						
					}
				}
			}
			
		}
	}
}

