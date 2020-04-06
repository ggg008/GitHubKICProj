<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str = "Hello JSP";
		System.out.println(str); //console 출력	
		out.println("<b>" + str + "</b>"); // client Browser 출력
		//was애 의해 해석되어 html 소스로는 보이지않음
	%>
</body>
</html>