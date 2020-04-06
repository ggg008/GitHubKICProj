<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <!-- 요청한 클라이언트의 아이피 -->
 <%= request.getRemoteAddr() %> <br>
 <%= request.getContentType() %> <br>
 <%= request.getProtocol() %> <br>
 <%= request.getMethod() %> <br>
 <%= request.getRequestURI() %> <br>
 <%= request.getServerName() %> <br>
</body>
</html>