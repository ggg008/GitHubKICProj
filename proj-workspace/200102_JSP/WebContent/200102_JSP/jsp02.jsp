<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- WAS에 의해 없어지는 JSP 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <b>Title</b> -->

	<%
		Date today = new Date();
		System.out.println("현재날짜 :" +  today.toString());
	%>


</body>
</html>