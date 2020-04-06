<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="utill.FormatUtill"%>

<%
	request.setAttribute("price", 12345L);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
가격은 ${ FormatUtill.number(price, '#,##0') }원 입니다. <!-- '도 지원 -->
</body>
</html>