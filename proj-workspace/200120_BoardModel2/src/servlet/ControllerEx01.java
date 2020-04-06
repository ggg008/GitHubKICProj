package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.Action;
import model2.DeleteAction;
import model2.DeleteOkAction;
import model2.ListAction;
import model2.ModifyAction;
import model2.ModifyOkAction;
import model2.ViewAction;
import model2.WriteAction;
import model2.WriteOkAction;

/**
 * Servlet implementation class ControllerEx01
 */
@WebServlet("/controller")
public class ControllerEx01 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

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
			
			String action = request.getParameter("action");
			
			String urlPath = "/WEB-INF/model2";
			String url = "";
			
			Action scAction = null;
			if( action == null || action.equals("") || action.equals("list")) {
				//모델 처리구간
				scAction = new ListAction();
				scAction.execute(request, response);
				
				url = "/board_list1.jsp";
				
			} else if (action.equals("view")) {
				scAction = new ViewAction();
				scAction.execute(request, response);

				url = "/board_view1.jsp";
				
			} else if (action.equals("write")) {
				scAction = new WriteAction();
				scAction.execute(request, response);

				url = "/board_write1.jsp";
				
			} else if (action.equals("write_ok")) {
				scAction = new WriteOkAction();
				scAction.execute(request, response);

				url = "/board_write1_ok.jsp";
				
			} else if (action.equals("modify")) {
				scAction = new ModifyAction();
				scAction.execute(request, response);

				url = "/board_modify1.jsp";
				
			} else if (action.equals("modify_ok")) {
				scAction = new ModifyOkAction();
				scAction.execute(request, response);

				url = "/board_modify1_ok.jsp";
				
			} else if (action.equals("delete")) {
				scAction = new DeleteAction();
				scAction.execute(request, response);

				url = "/board_delete1.jsp";
				
			} else if (action.equals("delete_ok")) {
				scAction = new DeleteOkAction();
				scAction.execute(request, response);

				url = "/board_delete1_ok.jsp";
				
			} else {
				
				url = "/error.jsp";
			}
			
			//forward와 동일
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
