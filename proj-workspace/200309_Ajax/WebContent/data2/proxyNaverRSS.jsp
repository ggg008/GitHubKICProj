<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import var="data2" charEncoding="utf-8" url="http://newssearch.naver.com/search.naver">
	<c:param name="where" value="rss"/>
	<c:param name="query" value="${ param.data }"/>
</c:import>

${ data2 }