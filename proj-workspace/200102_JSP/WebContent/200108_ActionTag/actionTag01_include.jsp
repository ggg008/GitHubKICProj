<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

시작
<br>
<%
	String i = "15";
%>
<!-- 보낸다(주석이 태그 내부로 들어가면 안됨 -->
<!-- 포함 -->
<!-- jsp파일에 완전 포함 -->
<jsp:include page="a.jsp">
	<jsp:param value="<%=i%>" name="i" />
</jsp:include>
끝~~~~~~~~~~~~~~~~~~~~~~~~~~~
<br>
