<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model1.BoardTO"%>
<%
	//model2 -> ***Action
	BoardTO to = new BoardTO();
	to.setSubject("제목");
	to.setWriter("작성자");
	
	//pageContext.setAttribute("to", to);
	request.setAttribute("to", to);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= to.getSubject() %>
	<br>
	<%= to.getWriter() %>
	<br>
	${ to.subject } <br> <!-- getter를 이용한 접근 -->
	${ to.writer } <br>
	
</body>
</html>

