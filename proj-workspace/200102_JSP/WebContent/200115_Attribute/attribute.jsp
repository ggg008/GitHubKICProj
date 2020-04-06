<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = "data";

	pageContext.setAttribute("data", data);
	
	out.println(pageContext.getAttribute("data"));

%>