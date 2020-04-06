<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//p350
	out.println(out.getRemaining() + "<br>");
	out.println("1<br>");
	out.println("2<br>");
	out.println("3<br>");
	
	out.clearBuffer();

	out.println(out.getRemaining() + "<br>");
	out.println("4<br>");
	out.println("5<br>");
	out.println("6<br>");
	
	out.flush();

	out.println(out.getRemaining() + "<br>");
	out.println("7<br>");
	out.println("8<br>");
	out.println("9<br>");
	
	out.close();
	
	out.println("10<br>");
	out.println("11<br>");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>