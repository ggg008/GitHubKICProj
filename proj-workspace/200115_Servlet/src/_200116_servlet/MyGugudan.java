package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyGugudan extends HttpServlet
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
		int startdan = 0;
		int enddan = 0;
		if ((req.getParameter("startdan") != null && !req.getParameter("startdan").equals(""))
				&& (req.getParameter("enddan") != null && !req.getParameter("enddan").equals(""))) {
			startdan = Integer.parseInt(req.getParameter("startdan"));
			enddan = Integer.parseInt(req.getParameter("enddan"));
		}

		// TODO Auto-generated method stub
		StringBuffer html = new StringBuffer();
		{
			resp.setContentType("text/html; charset=UTF-8");
			html.append("<!DOCTYPE html>");
			html.append("<html>");
			html.append("	<head>");
			html.append("		<meta charset='UTF-8'>");
			html.append("		<title>Hello Servlet</title>");
			html.append("	</head>");
			html.append("	<body>");

			html.append("<form action='./mygugudan' method='post'>");
			html.append("시작단 : <input type='text' name='startdan'>");
			html.append("끝단 : <input type='text' name='enddan'>");
			html.append("<input type='submit' value='구구단 전송'>");
			html.append("</form>");

			if (startdan != 0 && enddan != 0) {
				html.append("<hr>");
				html.append("<table width='800' border='1'>");
				for (int i = startdan; i <= enddan; ++i) {
					html.append("<tr>");
					for (int j = 1; j <= 9; ++j) {
						html.append("<td>" + i + "X" + j + "=" + (i * j) + "</td>");
					}
					html.append("</tr>");
				}
				html.append("</table>");
			}

			html.append("	</body>");
			html.append("</html>");
		}
		PrintWriter out = resp.getWriter();
		out.println(html);

	}
}
