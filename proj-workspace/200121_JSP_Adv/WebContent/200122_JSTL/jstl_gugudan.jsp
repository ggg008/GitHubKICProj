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

	<table border="2">
		<c:forEach var="i" begin="0" end="9">
			<tr align="center">
				<c:forEach var="j" begin="0" end="9">
					<c:choose>
						<c:when test="${ i == 0 && j == 0 }">
							<td></td>
						</c:when>
						<c:when test="${ i == 0 }">
							<td>x${ j }</td>
						</c:when>
						<c:when test="${ j == 0 }">
							<td>${ i }단</td>
						</c:when>
						<c:otherwise>
							<td align="left">${ i }x${ j }=${ i*j }</td>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</tr>
		</c:forEach>

	</table>


</body>
</html>