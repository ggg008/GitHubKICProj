<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- 외부 사이트 호출 -->

<c:import var="html" url="https://m.daum.net"/>
<c:import var="html2" url="https://media.daum.net/syndication/today_sisa.rss"/>
<textarea wrap="soft" rows="50" cols="600" >
	${ html }
</textarea>