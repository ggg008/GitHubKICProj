<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="num" value="${95}"/>
점수 <c:out value="${ num }"/>은

<c:if test="${60 < num }">
	합격입니다
</c:if>
<br>

점수 <c:out value="${ num }"/>은
<c:choose>
	<c:when test="${ 90 <= num }">A학점입니다.</c:when>
	<c:when test="${ 80 <= num }">B학점입니다.</c:when>
	<c:when test="${ 70 <= num }">C학점입니다.</c:when>
	<c:when test="${ 60 <= num }">D학점입니다.</c:when>	
</c:choose>