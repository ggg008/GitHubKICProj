package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.View1Action;
import model.View2Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class ControllerUrl extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println(this.getClass().getName());
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println(this.getClass().getName());
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("utf-8");

			// http://localhost/200128_MVCModel2Url/view1.do
			// http://localhost/200128_MVCModel2Url/
			// + /view1.do
			// url 경로 확인하기 위한 문자열 재가공
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			String url = null;		
			System.out.println(path);
			
			Action action = null;
			if (path.equals("/*.do") || path.equals("/view1.do")) {
				action = new View1Action();
				action.execute(request, response);
				
				url = "/WEB-INF/views/view1.jsp";
				
			} else if (path.equals("/view5.do")) {
				action = new View2Action();
				action.execute(request, response);
				
				url = "/WEB-INF/views/view2.jsp";
				
			} else {
				url = "/WEB-INF/views/error.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
