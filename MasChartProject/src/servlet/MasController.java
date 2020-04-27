package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import subController.LoginAction;
import subController.LoginOkAction;
import subController.LogoutOkAction;

import Crawler.ChartDataCollector;
import Crawler.SeleniumTest;
import modelPaging.CandlestickTO;
import modelPaging.ChartListInfoTOTemp;
import modelPaging.MasDAO;
import subController.ChartAction;

import subController.MasAction;
import subController.SignupAction;
import subController.SignupOkAction;

/**
 * Servlet implementation class MasController
 */
@WebServlet("*.do")
public class MasController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	ChartDataCollector chartDataCollector;

	public MasController()
	{
		// TODO Auto-generated constructor stub
		super();
		System.out.println("안녕하세요! Mas컨트롤러 입니다! 초기화합니다!");
		InetAddress ip;
		try {
			ip = InetAddress.getLocalHost();
			System.out.println("Host Name = [" + ip.getHostName() + "]");
			System.out.println("Host Address = [" + ip.getHostAddress() + "]"); 
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//윈도에서 실행 크라울링 안하기
		if(!System.getProperty("os.name").contains("Win"))
			chartDataCollector = new ChartDataCollector();
		
//		SeleniumTest sTest = new SeleniumTest();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("utf-8");
			
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			
			String urlPath = "/WEB-INF/MasChart";
			String url = "";
			
			MasAction masAction = null;
			
			if (path.equals("/*.do") || path.equals("/index.do")) {
				
				url = "/index.html";
			} else if (path.equals("/chartView.do")) {

				masAction = new ChartAction();
				masAction.execute(request, response);

				urlPath = "";
				url = "/dist/jsp/chartView.jsp";
				
			} else if (path.equals("/proxyLastPrice.do")) {
				
				urlPath = "";
				url = "/dist/jsp/proxyLastPrice.jsp";
				//System.out.println(url);
				
			} else if (path.equals("/proxyChart.do")) {
				
				urlPath = "";
				url = "/dist/jsp/proxyChart.jsp";
				//System.out.println(url);

			} else if (path.equals("/proxyTest.do")) {
				
				urlPath = "";
				url = "/dist/jsp/proxyTester.jsp";
				//System.out.println(url);
				
			} else if (path.equals("/authentication-login.do")) {
				
				masAction = new LoginAction();
				masAction.execute(request, response);
				url = "/authentication-login.html";
				
			} else if (path.equals("/login.do")) {
				
				masAction = new LoginOkAction();
				masAction.execute(request, response);
				urlPath = "";
				url = "/dist/jsp/login.jsp";
				
			} else if (path.equals("/logout.do")) {
				
				masAction = new LogoutOkAction();
				masAction.execute(request, response);
				urlPath = "";
				url = "/dist/jsp/logout.jsp";
			
			} else if (path.equals("/authentication-register.do")) {
				
				masAction = new SignupAction();
				masAction.execute(request, response);
				url = "/authentication-register.html";
				
			} else if (path.equals("/signup.do")) {
				//System.out.println("1");
				masAction = new SignupOkAction();
				masAction.execute(request, response);
				//System.out.println("2");
				urlPath = "";
				url = "/dist/jsp/signup.jsp";
			
				
			} else if (path.equals("/form-basic.do")) {
				// 프로필 보기 및 수정
				url = "/form-basic.html";
				
			} else { 
				
				url = "/error-404.html";
			}
			
			/*
			if( action == null || action.equals("") || action.equals("list")) {
				//모델 처리구간
				scAction = new ListAction();
				scAction.execute(request, response);
				
				url = "/board_list1.jsp";
				
			} else if (path.equals("/view.do")) {
				scAction = new ViewAction();
				scAction.execute(request, response);

				url = "/board_view1.jsp";
			} else if (path.equals("/write.do")) {
				scAction = new WriteAction();
				scAction.execute(request, response);

				url = "/board_write1.jsp";
				
			} else if (path.equals("/write_ok.do")) {
				scAction = new WriteOkAction();
				scAction.execute(request, response);

				url = "/board_write1_ok.jsp";
				
			} else if (path.equals("/modify.do")) {
				scAction = new ModifyAction();
				scAction.execute(request, response);

				url = "/board_modify1.jsp";
				
			} else if (path.equals("/modify_ok.do")) {
				scAction = new ModifyOkAction();
				scAction.execute(request, response);

				url = "/board_modify1_ok.jsp";
				
			} else if (path.equals("/delete.do")) {
				scAction = new DeleteAction();
				scAction.execute(request, response);

				url = "/board_delete1.jsp";
				
			} else if (path.equals("/delete_ok.do")) {
				scAction = new DeleteOkAction();
				scAction.execute(request, response);

				url = "/board_delete1_ok.jsp";
			} else { 
			
				url = "/error.jsp";
			}
			*/
			
			//forward와 동일 - 요청 재지정
			RequestDispatcher dispatcher = request.getRequestDispatcher(urlPath + url);
			dispatcher.forward(request, response);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
