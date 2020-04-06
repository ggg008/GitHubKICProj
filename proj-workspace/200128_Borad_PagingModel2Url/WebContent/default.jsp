<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//기본페이지 리다이렉션 : 웰컴파일
	response.sendRedirect("./controller?action=list");
%>