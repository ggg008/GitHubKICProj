<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
	request.setCharacterEncoding( "utf-8" );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="jstl_zipcode.jsp" method="post">
동이름 : <input type="text" name="dong" />
<input type="submit" value="검색" />
</form>

<br /><hr /><br />

<c:if test="${ !empty param.dong }"> <!-- null값 인지 체크 -->
	<s:query dataSource="jdbc/mariadb2" var="rs">
	 	select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like '${ param.dong }%'
	 	<%-- 
	 	<s:param value='${ param.dong }%' />
	 	 --%>
	</s:query>
	
	<table width="800" border="1">
		<tr>
		<c:forEach var="columnName" items="${ rs.columnNames }">
			<td>${ columnName }</td>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach var="data" items="${ rs.rows }">
		<tr>
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

</body>
</html>