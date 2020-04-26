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
		
		tMain.testHtmlParse();
		
		
		String fsymPrice = "5,795.87";		
//		double lastPrice = Double.valueOf(fsymPrice.replaceAll("^\\D", "").replaceAll(",", "").trim());
		
//		System.out.println(lastPrice);
		

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
//								System.out.println(document);
//								writeLog(document.toString());

			Elements titles = document.select(selectorGecko);

			// lock
			for (int i = titles.size(); i < titles.size(); ++i) { // -- 3. Elemntes 길이만큼 반복한다.
				Element element = titles.get(i);
				if (i == 0)
					continue;

//					System.out.println(element.text()); // -- 4. 원하는 요소가 출력된다.
//					String[] strElt = element.text().split(" ");
//					System.out.printf("%s-%s-%s-%s-%s\n", strElt[0], strElt[1], strElt[2], strElt[3], strElt[4]);

			}

		}
	}

}
