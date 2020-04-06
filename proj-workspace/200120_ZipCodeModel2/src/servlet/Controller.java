package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.SubContoroller;
import model2.ZipcodeAction;
import model2.ZipcodeOkAction;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) 
	{
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			
			String url = "";
			
			SubContoroller model = null;
			if( action == null || action.equals("")) {
				
				url = "/WEB-INF/error.jsp";
				
			} else if(action.equals("zipcode")) {
				//모델 처리구간
				
				model = new ZipcodeAction();
				model.execute(request, response);
				
				url = "/WEB-INF/zipcode.jsp";
			} else if(action.equals("zipcode_ok")) {
				
				model = new ZipcodeOkAction();
				model.execute(request, response);
				
				url = "/WEB-INF/zipcode_ok.jsp";
			} else {
				
				url = "/WEB-INF/error.jsp";
			}
			
			//forward와 동일
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
