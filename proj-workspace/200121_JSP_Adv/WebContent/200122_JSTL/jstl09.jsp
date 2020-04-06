<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- 외부 사이트 호출 -->


<c:import var="data" url="https://media.daum.net/syndication/today_sisa.rss"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
RSS 읽기 (후처리 가능)
<textarea wrap="soft" rows="50" cols="600" >
	${ data }
</textarea>
</body>
</html>