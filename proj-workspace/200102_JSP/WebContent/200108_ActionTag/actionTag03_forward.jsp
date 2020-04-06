<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

시작
<br>
<%
	String i = "5";
%>
<!-- 이동 -->
<jsp:forward page="c.jsp">
	<jsp:param value="<%=i%>" name="i" />
</jsp:forward>
끝
<br>
