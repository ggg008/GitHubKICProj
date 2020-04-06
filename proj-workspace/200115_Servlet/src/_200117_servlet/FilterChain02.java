package _200117_servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterChain02 implements Filter
{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		System.out.println(this.getClass().getName() + " 전처리");
		chain.doFilter(request, response);
		System.out.println(this.getClass().getName() + " 후처리");
	}
	
}
