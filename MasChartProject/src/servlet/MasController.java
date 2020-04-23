package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import subController.Action;
import subController.DeleteAction;
import subController.DeleteOkAction;
import subController.ListAction;
import subController.ModifyAction;
import subController.ModifyOkAction;
import subController.ViewAction;
import subController.WriteAction;
import subController.WriteOkAction;

/**
 * Servlet implementation class MasController
 */
@WebServlet("*.do")
public class MasController extends HttpServlet
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
			
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			
//			String urlPath = "/WEB-INF/paging2";
			String urlPath = "/WEB-INF/MasChart";
			String url = "";
			
			
			Action scAction = null;
			if (path.equals("/*.do") || path.equals("/index.do")) {
				
				url = "/index.html";
			} else if (path.equals("/proxyLastPrice.do")) {
				
				url = "/proxyLastPrice.jsp";
				
			} else if (path.equals("/proxyChart.do")) {
				
				url = "/proxyChart.jsp";
				
			} else { 
				
				url = "/error.jsp";
			}
				/*
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
