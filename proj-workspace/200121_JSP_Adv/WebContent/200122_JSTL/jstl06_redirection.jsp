<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<c:redirect url="http://www.daum.net"/>
 --%>
<!-- 리다이렉션 -->
<c:redirect url="http://search.daum.net/search">
	<c:param name="w" value="tot"/>
	<c:param name="q" value="스타워즈"/>
</c:redirect>
