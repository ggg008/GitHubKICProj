package Crawler;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SeleniumTest
{


	// WebDriver
	private WebDriver driver;

	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:/MyCloud/GitHubKICProj/MasChartProject/src/chromedriver.exe";
	Path path = Paths.get(System.getProperty("user.dir"), "src/chromedriver.exe");
//	public static final String WEB_DRIVER_PATH = "C:/MyCloud/GitHubKICProj/MasChartProject/chromedriver.exe";

	// 크롤링 할 URL
	private String base_url;

	public SeleniumTest()
	{
		super();

		System.out.println(System.getProperty("user.dir"));
		// System Property SetUp
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
        options.addArguments("--start-maximized");          // 최대크기로
        options.addArguments("--headless");                 // Browser를 띄우지 않음
        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
		
		// Driver SetUp
		driver = new ChromeDriver(options);
		base_url = "https://upbit.com/exchange?code=CRIX.UPBIT.USDT-BTC";
		
		crawl();
	}

	public void crawl()
	{

		try {
			
			driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
//			WebDriverWait wait = new WebDriverWait(driver, 30);
//            WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.tagName("div"))); //By.cssSelector("#text-tool-caret")));
            
//            List<WebElement> contents = parent.findElements(By.cssSelector("div.css-1dbjc4n.r-my5ep6.r-qklmqi.r-1adg3ll"));
//            System.out.println( "조회된 콘텐츠 수 : "+contents.size() );
            
			// get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
			driver.get(base_url);
			System.out.println(driver.getPageSource());
			this.writeLog(driver.getPageSource());
		} catch ( TimeoutException e ) {
            System.out.println("목록을 찾을 수 없습니다.");
		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			driver.close();
		}

	}
	
	private void writeLog(String data)
	{
		BufferedWriter bw = null;
		
		try {
			
			bw = new BufferedWriter(new FileWriter("..\\..\\myLog.html"));
			
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

}
