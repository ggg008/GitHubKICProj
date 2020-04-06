<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  태그라이브러리를 접두사 "c"로 사용하겠다 -->

<!-- 출력 사용법 비교 -->
<%="browser1"%>
${ "browser1" }
<c:out value="browser1" />
<br>
<!-- /같은 의미 -->
<hr>

<c:out value="${data = 1 }" />
<br>

<hr>

<!-- jstl 변수 -->
<c:set var="data1" value="test1" scope="page" />
<%
	pageContext.setAttribute("data2", "test2");
%>
<c:set var="data3" scope="page">test3</c:set>

${ data1 } ${ data2 } ${ data3 }
<br>
<c:out value="${ data1 }" />
<c:out value="${ data2 }" />
<c:out value="${ data3 }" />
<!-- /같은의미 -->