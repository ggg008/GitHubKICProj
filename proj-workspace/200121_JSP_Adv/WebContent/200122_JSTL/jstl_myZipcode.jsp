<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource url="jdbc:mysql://localhost:3306/project"
	driver="org.mariadb.jdbc.Driver" user="project" password="123456"
	var="ds" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="get"><!-- action값 비울시 자기자신 호출 -->
		동이름 검색 : <input type="text" name="dong" value="" /> 
		<input type="submit" value="우편번호검색">
	</form>
	
	<hr>

	<!-- null 이 없는건 아님 -->
	<c:if test="${ param.dong != null }">
		검색실행 : ${ param.dong }
		
		<sql:query dataSource="${ ds }" var="rs"
			sql="SELECT seq, zipcode, sido, gugun, dong, ri, bunji FROM zipcode WHERE dong LIKE ?">
			<sql:param value="%${ param.dong }%" />
		</sql:query>
		
		<table border="2">
			<tr align="center">
				<c:forEach var="columnName" items="${ rs.columnNames }">
					<td>${ columnName }</td>
				</c:forEach>
			</tr>
			
			<c:forEach var="data" items="${ rs.rows }">
				<tr align="center">
					<td>${ data.seq }</td>
					<td>${ data.zipcode }</td>
					<td>${ data.sido }</td>
					<td>${ data.gugun }</td>
					<td>${ data.dong }</td>
					<td>${ data.ri }</td>
					<td>${ data.bunji }</td>
				</tr>
			</c:forEach>
			
		</table>
		
	</c:if>

	<br>
</body>
</html>