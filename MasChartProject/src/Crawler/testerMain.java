package Crawler;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import modelPaging.CandlestickTO;
import modelPaging.ChartListInfoTOTemp;
import modelPaging.MasDAO;
import net.bytebuddy.asm.Advice.This;

public class testerMain
{
	public static void main(String[] args)
	{
		// TODO Auto-generated method stub

		
//		Thread thread = new Thread(new testerMain().new TestCrawling());
//		thread.start();
		
		testerMain tMain = new testerMain();
		
//		tMain.testHtmlParse();
		
		Thread thread = new Thread(tMain.new TestCrawling());
		thread.start();
		
		
		String fsymPrice = "5,795.87";		
//		double lastPrice = Double.valueOf(fsymPrice.replaceAll("^\\D", "").replaceAll(",", "").trim());
		
//		System.out.println(lastPrice);
		
		String strcandleKey = "BTCUSDminute1588062840";
		
		String propName = strcandleKey.replaceAll("minute", "").replaceAll("[0-9]", "");
		
		System.out.println(propName);
		

	}

	public static void writeLog(String className, String data, String ext)
	{
		long utcWeight = -2;// utc 시간보정
		String dirName = ".." + File.separator + "testerLocalData";
		
		BufferedWriter bw = null;

		long now = System.currentTimeMillis() / 1000 + utcWeight;
		try {
			File file = new File(dirName);
			file.mkdirs();

			if(className == null) {
				className = "testerLog";
			}
			
			String filename = className +"_" + now + "." + ext;
			bw = new BufferedWriter(new FileWriter(dirName + File.separator + filename));

			bw.write(data);

			System.out.println("※테스트 로그 출력 완료 파일이름 : " + filename);

		} catch (IOException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			if (bw != null)
				try {
					bw.close();
				} catch (IOException e) {
				}
		}
	}
	
	private void testJsonParse() 
	{
		String dirName = ".." + File.separator + "testerLocalData";
		
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
        	
        	//masDAO.setCandlestickBulk(candlestickTOs);
			
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		System.out.println(jsonStr);
		
		
	}
	
	private void testHtmlParse() 
	{
		String dirName = ".." + File.separator + "testerLocalData";
		
		// TODO Auto-generated method stub
		BufferedReader br = null;
		StringBuffer parseStr = new StringBuffer();
		
		String selectorCC = "tr[ng-repeat=(keyCoinData,coinData) in getCoinArray()]";
		Document document = null;
		
		try {
			br = new BufferedReader(new FileReader(dirName + File.separator + "testParseHtml.html"));
			
			String dataString = null;
			while((dataString = br.readLine()) != null ) {
				parseStr.append(dataString);
			}
			
//			System.out.println(parseStr.toString());

			document = Jsoup.parse(parseStr.toString());
			
			Elements titles = document.select(selectorCC);
			
			
			StringBuffer sBuffer = new StringBuffer();
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
					
//					System.out.println("☆" + split.get(j).text());
					
				}
				
				System.out.println(fsym + " : " + fsymPrice);
				
			}			
			
//			writeLog(this.getClass().getName(), sBuffer.toString(), "txt");			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		System.out.println(jsonStr);
		
		
	}

	// 클라울링 쓰레드
	class TestCrawling implements Runnable
	{
		public TestCrawling()
		{
		}

		@Override
		public void run()
		{
			String url1 = "https://intoli.com/blog/making-chrome-headless-undetectable/chrome-headless-test.html";
			String url2 = "http://luka7.net/";
			String url3 = "https://www.cryptocompare.com/coins/list/USD/1";
			String url4 = "https://www.investing.com/crypto/currencies";
			
			// TODO Auto-generated method stub
			String parseUrl = url4;
			String selectorCMC = ".cmc-table-row";
			String selectorGecko = "div.sort, .table, .mb-0 tbody tr";
			String selectorInvesting = "#fullColumn table.genTbl tbody tr";
			Document document = null;
			try {
				Response response = Jsoup.connect(parseUrl)
                        .userAgent("Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36")
                        .execute();
				
				document = Jsoup.connect(parseUrl).timeout(10000)
						.userAgent("Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36")
                        .header("Accept-Language", "en-US")
                        .header("Accept-Encoding", "gzip,deflate,sdch")
                        .cookies(response.cookies())
//                        .header("Origin", "http://tistory.com/")
//                        .header("Referer", "https://www.tistory.com/auth/login")
//                        .header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
//                        .header("Content-Type", "application/x-www-form-urlencoded")
//                        .header("Accept-Encoding", "gzip, deflate, br")
//                        .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                        //.method(Connection.Method.GET)
                        .get();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//								System.out.println(document);
//			writeLog(null, document.toString(), "html");

			Elements titles = document.select(selectorInvesting);

			System.out.println(titles.size());
			// lock
			for (int i = 0; i < titles.size(); ++i) { // -- 3. Elemntes 길이만큼 반복한다.
//				Elements elts = titles.get(i).;
				
				Elements split = titles.get(i).select("td");

				String fsym = split.get(3).text();
				String fsymPrice = split.get(4).text();
				
				
				
				for(int j = 0; j < split.size(); ++j) {
					
//					if(j == 3) {
//						String[] strSym = split.get(j).text().split(" ");
//						fsym = strSym[strSym.length - 1];
//					} else if (j == 4) {						
//						fsymPrice = split.get(j).text();
//					}
					
//					System.out.println("☆" + split.get(j).text());					
				}					
//				System.out.println("==============");
				
				double lastPrice = Double.valueOf(fsymPrice.replaceAll("^\\D", "").replaceAll(",", "").trim());
				
				
//				System.out.print("lastPrice : ");
//				System.out.println(lastPrice * 0.0015);
				lastPrice = lastPrice + lastPrice * 0.0015;
				System.out.println(fsym + " : " + lastPrice);
				
//				System.out.print("test : ");
//				System.out.println(titles.get(i).text());
				
//				if (i == 0)
//					continue;

//					System.out.println(element.text()); // -- 4. 원하는 요소가 출력된다.
//					String[] strElt = element.text().split(" ");
//					System.out.printf("%s-%s-%s-%s-%s\n", strElt[0], strElt[1], strElt[2], strElt[3], strElt[4]);

			}
			System.out.println("종료");

		}
	}

}
