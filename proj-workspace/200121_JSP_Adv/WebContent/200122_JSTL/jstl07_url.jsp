<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="url1" value="./list.do"/>

${url1}
<hr>

<c:url var="url2" value="http://search.daum.net/search">
	<c:param name="w" value="tot"/>
	<c:param name="q" value="스타워즈"/>
</c:url>


${url2}

<%-- 
<c:redirect url="${ url1 }"/>
 --%>