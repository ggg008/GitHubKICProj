package _200117_servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 * Servlet Filter implementation class FilterEx02
 */
//@WebFilter(
//		urlPatterns = { "*.jsp" }, 
//		initParams = { 
//				@WebInitParam(name = "encoding", value = "utf-8", description = "필터2")
//		})
public class FilterEx02 implements Filter {

	private String encoding = null;

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding(encoding);
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

		encoding = fConfig.getInitParameter("encoding");
	}
	

}
