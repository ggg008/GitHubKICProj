<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- request
	클라이언트와 서버 정보 
 -->
	<!-- 
 	전송헤더 = 데이터 + 환경 
 	hashMap과 유사한 형태로.. = key + value
 	자바스크립트 네비게이터(navigator)와 유사
 	
 -->
 <%
 	Enumeration headerEnum = request.getHeaderNames();
 	while(headerEnum.hasMoreElements()){
 		String headerName = (String)headerEnum.nextElement();
 		String headerValue = request.getHeader(headerName);
 		out.println(headerName+ " : " + headerValue +  "<br>");
 	}
 %>
</body>
</html>