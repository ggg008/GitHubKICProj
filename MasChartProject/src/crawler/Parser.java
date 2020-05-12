package crawler;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Parser
{
	public Parser()
	{
		// TODO Auto-generated constructor stub
		/*
		 * Document 클래스 : 연결해서 얻어온 HTML 전체 문서 Element 클래스 : Documnet의 HTML 요소 Elements
		 * 클래스 : Element가 모인 자료형
		 */
		String url = "https://www.w3schools.com";
		String selector = ".w3-bar-item, .w3-button";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get(); // -- 1. get방식의 URL에 연결해서 가져온 값을 doc에 담는다.
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		Elements titles = doc.select(selector); // -- 2. doc에서 selector의 내용을 가져와 Elemntes 클래스에 담는다.

		for (Element element : titles) { // -- 3. Elemntes 길이만큼 반복한다.
			System.out.println(element.text()); // -- 4. 원하는 요소가 출력된다.
		}
	}
}
