<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("i");
	out.println(a + "<br>");
	out.println("난 a.jsp<br>");
	out.println("이 파일은 " +  request.getRequestURL() + "<br>");
%>