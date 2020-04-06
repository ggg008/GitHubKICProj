<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
<sql:setDataSource dataSource="jdbc/mariadb2" var="ds" />
 --%>
 <!-- 
 커넥션풀 2가지 방법
 context.xml 필요! 
 -->
<sql:query dataSource="jdbc/mariadb2" var="rs" sql="SELECT * FROM dept" startRow="2" maxRows="3" /> <!-- limit문과 유사 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl sql</title>
</head>
<body>
<c:forEach var="columnName" items="${ rs.columnNames }">
	${ columnName } - 
</c:forEach>

<br>
<br>
<c:forEach var="data" items="${ rs.rows }">
	${ data.deptno } / ${ data[ "dname" ] } / ${ data[ "loc" ] } <br>
</c:forEach>

</body>
</html>
