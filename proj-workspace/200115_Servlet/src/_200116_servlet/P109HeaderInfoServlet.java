package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/headerInfo")
public class P109HeaderInfoServlet extends HttpServlet
{
	//브라우저 정보
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<html>");
		out.println("<head><title>Request 정보 출력 Servlet</title></head>");
		out.println("<body>");
		out.println("<h3>요청 헤더 정보</h3>");
		Enumeration<String> em = req.getHeaderNames();
		while(em.hasMoreElements()) {
			String s = em.nextElement();
			out.println(s + " : " + req.getHeader(s) + "<br>");
		}
		out.println("</body></html>");
		out.close();
	}
}
