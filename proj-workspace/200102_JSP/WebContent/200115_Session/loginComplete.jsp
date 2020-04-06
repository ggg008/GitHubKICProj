<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//loginComplete.jsp
	if (session.getAttribute("sess_id") == null) {
		out.println("<script type='text/javascript'>");
		out.println("alert('로그인을 해야합니다.')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	} else {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
loginComplete.jsp
<hr>
<a href="logOut.jsp">로그아웃</a>

</body>
</html>

<%
	}
%>