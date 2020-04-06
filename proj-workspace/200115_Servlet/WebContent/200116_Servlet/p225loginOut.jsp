<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 인증</title>
</head>
<body>
<%
	if(session.isNew() || session.getAttribute("id") == null) {
%>

	<form action="../logProc" method="post">
		ID : <input type="text" name="id"> <br> 
		비밀번호 : <input type="password" name="pwd"> <br> 
		<input type="submit" value="로그인">
	</form>
<%
	} else {
%>
	<p>
		<a href="../logProc">로그아웃</a>
	</p>
<%
	}
%>
</body>
</html>