<%@page import="el.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>example</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="book" class="el.BookBean" />
	<!-- 
		book 객체 모든 멤버변수에 동일한 이름의 파라메터 값 할당 ▼
		내부에서 request.getParameter(멤버변수) 호출 
		java beans
	-->
	<jsp:setProperty property="*" name="book" />
	<%
		request.setAttribute("book", book);
	%>
	<jsp:forward page="p427bookOutput.jsp" />
</body>
</html>