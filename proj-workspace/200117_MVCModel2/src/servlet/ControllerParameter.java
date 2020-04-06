package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;
import model.View1Model;
import model.View2Model;

/**
 * Servlet implementation class Controller1
 */
@WebServlet("/ControllerParameter")
public class ControllerParameter extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("abcd");
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("abcd");
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) 
	{
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			
			String url = "";
			
			System.out.println("abcd");
			
			Model model = null;
			if( action == null || action.equals("")) {
				
				url = "/WEB-INF/error.jsp";
				
			} else if(action.equals("view1")) {
				//모델 처리구간
				model = new View1Model();
				model.execute(request, response);
				
				url = "/WEB-INF/view1.jsp";
			} else if(action.equals("view2")) {
				model = new View2Model();
				model.execute(request, response);
				
				url = "/WEB-INF/view2.jsp";
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
