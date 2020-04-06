<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//원 페이지가 꺼져도 버퍼가 유지
	out.println("data : " + (String)application.getAttribute("data"));
%>