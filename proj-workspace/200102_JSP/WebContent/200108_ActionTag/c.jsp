<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String a = request.getParameter("i");
	out.println(a + "<br>");
	out.println("난 c.jsp<br>");
	out.println("이 파일은 " +  request.getRequestURL() + "<br>");
%>