package mysql.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mysql.model2.BoardAction;
import mysql.model2.DeleteAction;
import mysql.model2.DeleteOkAction;
import mysql.model2.ListAction;
import mysql.model2.ModifyAction;
import mysql.model2.ModifyOkAction;
import mysql.model2.ViewAction;
import mysql.model2.WriteAction;
import mysql.model2.WriteOkAction;

/**
 * Servlet implementation class ControllerEx01
 */
@WebServlet({"*.json", "*.mysql"})
public class ControllerEx extends HttpServlet {
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

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			
			String url = "";
			BoardAction action = null;
			if(path.equals("/*.mysql") || path.equals("/list.mysql")) {
				action = new ListAction();
				action.execute(request, response);
				
				url = "/mysql/board_list1.jsp";
				
			} else if(path.equals("/view.mysql")) {
				action = new ViewAction();
				action.execute(request, response);
				
				url = "/mysql/board_view1.jsp";
				
			} else if(path.equals("/write.mysql")) {
				action = new WriteAction();
				action.execute(request, response);
				
				url = "/mysql/board_write1.jsp";
				
			} else if(path.equals("/write_ok.mysql")) {
				action = new WriteOkAction();
				action.execute(request, response);
				
				url = "/mysql/board_write1_ok.jsp";
				
			} else if(path.equals("/modify.mysql")) {
				action = new ModifyAction();
				action.execute(request, response);
				
				url = "/mysql/board_modify1.jsp";
				
			} else if(path.equals("/modify_ok.mysql")) {
				action = new ModifyOkAction();
				action.execute(request, response);
				
				url = "/mysql/board_modify1_ok.jsp";
				
			} else if(path.equals("/delete.mysql")) {
				action = new DeleteAction();
				action.execute(request, response);
				
				url = "/mysql/board_delete1.jsp";
				
			} else if(path.equals("/delete_ok.mysql")) {
				action = new DeleteOkAction();
				action.execute(request, response);
				
				url = "/mysql/board_delete1_ok.jsp";
			//json
			} else if(path.equals("/*.json") || path.equals("/list.json")) {
				action = new ListAction();
				action.execute(request, response);
				
				url = "/json/board_list1.jsp";
				
			} else if(path.equals("/view.json")) {
				action = new ViewAction();
				action.execute(request, response);
				
				url = "/json/board_view1.jsp";
				
			} else if(path.equals("/write.json")) {
				action = new WriteAction();
				action.execute(request, response);
				
				url = "/json/board_write1.jsp";
				
			} else if(path.equals("/write_ok.json")) {
				action = new WriteOkAction();
				action.execute(request, response);
				
				url = "/json/board_write1_ok.jsp";
				
			} else if(path.equals("/modify.json")) {
				action = new ModifyAction();
				action.execute(request, response);
				
				url = "/json/board_modify1.jsp";
				
			} else if(path.equals("/modify_ok.json")) {
				action = new ModifyOkAction();
				action.execute(request, response);
				
				url = "/json/board_modify1_ok.jsp";
				
			} else if(path.equals("/delete.json")) {
				action = new DeleteAction();
				action.execute(request, response);
				
				url = "/json/board_delete1.jsp";
				
			} else if(path.equals("/delete_ok.json")) {
				action = new DeleteOkAction();
				action.execute(request, response);
				
				url = "/json/board_delete1_ok.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		}
		
	}
}





















