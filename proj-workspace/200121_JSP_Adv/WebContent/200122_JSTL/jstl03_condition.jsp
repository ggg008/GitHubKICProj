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
	<c:if test="true">
	무조건 실행<br>
	무조건 실행<br>
	</c:if>
	<hr>

	<c:set var="country" value="korea" />

	<!-- if -->
	<c:if test="${ country == 'korea' }">
		<!-- 연산자가 el에 있어서 -->
	이프문 실행<br>
	</c:if>
	<!-- / -->

	<!-- if ~else if -->
	<c:choose>
		<c:when test="${ country == 'canada' }">
		캐나다의 겨울은 춥다.
		</c:when>
		<c:when test="${ country == 'korea' }">
		한국의 겨울은 춥다.
		</c:when>
		<c:otherwise>
		어딘가의 겨울은 춥다.
		</c:otherwise>
	</c:choose>
	<!-- / -->

</body>
</html>