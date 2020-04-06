<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.setAttribute("data", "seesion value");

	out.println((String)session.getAttribute("data"));
%>