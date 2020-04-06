<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String data = request.getParameter("data");
	//println 소스코드에서의 개행
	out.println("Hello sub.jsp <br><br>");
	out.println("data1 : " + data + "<br>");
	out.println("data2 : " + (String)request.getAttribute("data2") + "<br>");
	out.println("data3 : " + request.getParameter("data3") + "<br>");
%>