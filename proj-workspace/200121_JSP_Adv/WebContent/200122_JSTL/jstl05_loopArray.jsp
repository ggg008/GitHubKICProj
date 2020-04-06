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
	<c:set var="intArr" value="<%=new Integer[] { 1, 2, 3, 4, 5 }%>" />

	${ intArr[0] } ${ intArr[2] }

	<hr>

	<c:forEach var="i" items="${ intArr }" begin="2" end="3">
		${ i } 
	</c:forEach>
	<hr>
	
	<!-- "홍길동", "박문수", "이몽룡"의 값을 가진 문자열 배열 선언하고 내용 확인 -->
	<c:set var="mans" value='<%= new String[] { "홍길동", "박문수", "이몽룡" } %>' /> 
	<!-- 태그는 작은 따옴표를 써도 된다 둘다 큰따옴표쓰면 구분불가로 "이스케이프 에러" -->
	
	<c:forEach var="man" items="${ mans }">
		${ man } 
	</c:forEach>
	
</body>
</html>