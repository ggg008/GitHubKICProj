<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode_ok</title>
</head>
<body>
zipcode_ok.jsp <br>
<%
	out.println("동이름 : " + request.getParameter("dong") + "<br>");
	out.println("데이터 : " + (String)request.getAttribute("data") +"<br>");//모델->뷰 데이터 전송할때 주로 Attribute..

%>
</body>
</html>