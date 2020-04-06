<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	StringBuffer html = new StringBuffer();

	html.append("<!DOCTYPE html>");
	html.append("<html>");
	html.append("<head>");
	html.append("<meta charset='UTF-8'>");
	html.append("<title>Insert title here</title>");
	html.append("</head>");
	html.append("<body>");
	html.append("Hello JSP");
	html.append("</body>");
	html.append("</html>");
	
	out.println(html.toString());
%>
<!-- 전부 출력으로 처리해보자 -->