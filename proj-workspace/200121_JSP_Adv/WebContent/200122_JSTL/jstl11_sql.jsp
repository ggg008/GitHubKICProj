<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource url="jdbc:mysql://localhost:3306/employees"
	driver="org.mariadb.jdbc.Driver" user="root" password="123456" var="ds" />
<sql:query dataSource="${ ds }" var="rs" sql="select * from dept"/>

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