package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx03 extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}

	// doGet-doPost 통합 처리 메서드( 조금이라도 더 쉽게 하기위해 )
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		System.out.println("doProcess 호출");

		req.setCharacterEncoding("utf-8");

		String data = req.getParameter("data");

		StringBuffer html = new StringBuffer();
		// !--html파트
		{
			resp.setContentType("text/html; charset=UTF-8");
			html.append("<!DOCTYPE html>");
			html.append("<html>");
			html.append("	<head>");
			html.append("		<meta charset='UTF-8'>");
			html.append("		<title>Hello Servlet</title>");
			html.append("	</head>");
			html.append("	<body>");
			html.append("		doProcess 호출 : " + data);
			html.append("	</body>");
			html.append("</html>");
		}
		// --html파트
		PrintWriter out = resp.getWriter();
		out.println(html);
	}
}
