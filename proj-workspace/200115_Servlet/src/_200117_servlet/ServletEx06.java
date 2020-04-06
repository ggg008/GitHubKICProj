package _200117_servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletEx06 extends HttpServlet
{
	private String user = null;
	private String password = null;
	
	@Override
	public void init(ServletConfig con) throws ServletException
	{
		// TODO Auto-generated method stub
		// web.xml에서 설정한 초기파라메터 읽기
		
		this.user = con.getInitParameter("user");
		this.password = con.getInitParameter("password");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		this.doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		this.doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println(user + " : " + password);
	}
}
