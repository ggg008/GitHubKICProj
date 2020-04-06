package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx02 extends HttpServlet
{
	@Override
	public void init() throws ServletException
	{
		// TODO Auto-generated method stub
		System.out.println("init 호출");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		// get 방식 요청
		System.out.println("doGet 호출");
		String data = req.getParameter("data");

		resp.setContentType("text/html; charset=UTF-8");

		StringBuffer html = new StringBuffer();
		html.append("<!DOCTYPE html>");
		html.append("<html>");
		html.append("	<head>");
		html.append("		<meta charset='UTF-8'>");
		html.append("		<title>Hello Servlet</title>");
		html.append("	</head>");
		html.append("	<body>");
		html.append("		doGet 호출 : " + data);
		html.append("	</body>");
		html.append("</html>");

		PrintWriter out = resp.getWriter();
		out.println(html);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		// post 방식 요청
		System.out.println("doPost 호출");
		
		req.setCharacterEncoding("utf-8");
		
		String data = req.getParameter("data");

		// !--html파트
		resp.setContentType("text/html; charset=UTF-8");

		StringBuffer html = new StringBuffer();
		html.append("<!DOCTYPE html>");
		html.append("<html>");
		html.append("	<head>");
		html.append("		<meta charset='UTF-8'>");
		html.append("		<title>Hello Servlet</title>");
		html.append("	</head>");
		html.append("	<body>");
		html.append("		doPost 호출 : " + data);
		html.append("	</body>");
		html.append("</html>");
		// --html파트
		
		
		PrintWriter out = resp.getWriter();
		out.println(html);
	}
}
