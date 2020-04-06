<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="i" begin="1" end="40" step="2">
	Hello ${ i } <br>
	</c:forEach>

	<hr>

	<c:forEach var="i" begin="1" end="5" step="1">
		<c:forEach var="j" begin="1" end="5" step="1">
		[i ${ i }] - [j ${ j }]<br>
		</c:forEach>
	</c:forEach>

</body>
</html>