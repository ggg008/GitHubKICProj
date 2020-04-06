<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String param 	= URLEncoder.encode("값1", "utf-8");//크롬에서는 필요없다
		String param2 	= URLEncoder.encode("값2", "utf-8");
	%>

	form.jsp -> 처리될 데이터 전송 -> form_ok.jsp
	<hr>
	<a href="./form_ok.jsp?data1=<%=param%>&data2=<%=param2%>">form_ok.jsp</a>
	<hr>
	<form action="./form_ok.jsp" method="get">
		데이터 1 : <input type="text" name="data1"> 
		데이터 2 : <input type="text" name="data2">
		ID : <input type="text" name="id"> 
		<input type="submit" value="전송하기"> 
		<input type="reset" value="초기화">
	</form>
	<hr>
	<form action="./form_ok.jsp" method="post">
		데이터 1 : <input type="text" name="data1"> 
		데이터 2 : <input type="text" name="data2"> <input type="submit" value="전송하기">
	</form>
	<!-- 보이지 않지만 암호화된건 아님 -->


</body>
</html>