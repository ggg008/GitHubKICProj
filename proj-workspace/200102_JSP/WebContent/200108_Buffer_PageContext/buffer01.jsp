<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false"%>

<%
	out.println("버퍼 크기 : " + out.getBufferSize() + "<br>");
	out.println("남은 버퍼 크기 : " + out.getRemaining() + "<br>");//출력으로도 버퍼를 소모

	for (int i = 1; i < 1000; ++i) {
		out.println(i + "Hello JSP<br>");
		if (i % 200 == 0) {
			out.println("남은 버퍼 크기 : " + out.getRemaining() + "<br>");
		}
	}
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