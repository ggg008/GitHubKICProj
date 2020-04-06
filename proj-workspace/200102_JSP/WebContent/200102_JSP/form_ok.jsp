<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	form_ok.jsp
	<hr>
	<%
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");

		out.println("data1 : " + data1 + "<br>");
		out.println("data2 : " + data2 + "<br>");
	%>
</body>
</html>