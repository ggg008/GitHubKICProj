package _200115_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx01 extends HttpServlet
{
	// tomcat(callback)이 실행하는 메서드 
	@Override
	public void init(ServletConfig config) throws ServletException
	{
		// TODO Auto-generated method stub
		System.out.println("init() 실행");
	}
	
	@Override
	public void destroy()
	{
		// TODO Auto-generated method stub
		System.out.println("destroy() 실행");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		System.out.println("service() 실행");
		
		resp.setContentType("text/html; charset=UTF-8");
		
		StringBuffer html = new StringBuffer();
		html.append("<!DOCTYPE html>");
		html.append("<html>");
		html.append("	<head>");
		html.append("		<meta charset='UTF-8'>");
		html.append("		<title>Hello Servlet</title>");
		html.append("	</head>");
		html.append("	<body>");
		html.append("		Hello Servlet");
		html.append("	</body>");
		html.append("</html>");
		
		PrintWriter out= resp.getWriter();
		out.println(html);
	}
	
}


