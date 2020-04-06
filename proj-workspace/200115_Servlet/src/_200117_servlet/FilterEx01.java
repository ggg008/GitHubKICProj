package _200117_servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterEx01 implements Filter
{
	private String encoding = null;
	
	// 서블릿이 아님
	@Override
	public void init(FilterConfig filterConfig) throws ServletException
	{
//		System.out.println("1. init() 호출");
		encoding = filterConfig.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException
	{
		// System.out.println("1. 전처리");
		// ->ServletRequest

		if (arg0.getCharacterEncoding() == null) {
			arg0.setCharacterEncoding(encoding);
		}

		arg2.doFilter(arg0, arg1);

		// <-ServletResponse
		// System.out.println("1. 후처리");

	}

}
