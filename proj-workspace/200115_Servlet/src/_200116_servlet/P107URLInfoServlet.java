package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/urlInfo")
@WebServlet("*.do")
public class P107URLInfoServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head><title>Request 정보 출력 Servlet</title></head>");
		out.println("<body>");
		out.println("<h3>요청방식과 프로토콜 정보</h3>");
		out.println("Request URI : " + req.getRequestURI() + "<br>");
		out.println("Request URL : " + req.getRequestURL() + "<br>");
		out.println("Context Path : " + req.getContextPath() + "<br>");
		out.println("Request Protocol : " + req.getProtocol() + "<br>");
		out.println("Servlet Path : " + req.getServletPath() + "<br>");
		
		out.println("요청 경로 : " + req.getRequestURI().replaceAll(req.getContextPath(), "") + "<br>");
//		String uri[] = req.getRequestURI().split("/");
//		out.println("Request2 URI : " + uri[uri.length - 1] + "<br>");
		
		out.println("</body></html>");
		out.close();
	}
}
