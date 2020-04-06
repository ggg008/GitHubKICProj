<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	application.setAttribute("data", "value");

	out.println("data : " + (String)application.getAttribute("data"));
%>