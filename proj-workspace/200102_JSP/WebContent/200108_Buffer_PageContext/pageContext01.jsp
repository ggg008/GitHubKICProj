<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	out.println("Hello JSP<br>");

	//out - JspWriter
	
	JspWriter writer = pageContext.getOut();
	writer.println("Hello JSP<br>");
	

	out.println(out + "<br>");

	out.println(writer + "<br>");
	
	out.println(request.getRequestURL());


	
%>