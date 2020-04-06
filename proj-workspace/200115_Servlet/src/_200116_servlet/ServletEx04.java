package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex04")
public class ServletEx04 extends HttpServlet
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
			html.append("<!DOCTYPE html>\n");
			html.append("<html>\n");
			html.append("	<head>\n");
			html.append("		<meta charset='UTF-8'>\n");
			html.append("		<title>Hello Servlet</title>\n");
			html.append("	</head>\n");
			html.append("	<body>\n");
			html.append("		doProcess 호출 : " + data + "\n");
			html.append("	</body>\n");
			html.append("</html>\n");
		}
		// --html파트
		PrintWriter out = resp.getWriter();
		out.println(html);
	}
}
