<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null && 0 < cookies.length) {
		for(int i = 0; i < cookies.length; ++i) {
			out.println(cookies[i].getName() + "<br>");
			out.println(cookies[i].getValue() + "<br>");
		}
	}
%>