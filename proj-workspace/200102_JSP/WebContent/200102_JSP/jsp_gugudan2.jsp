
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- WAS에 의해 없어지는 JSP 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <b>Title</b> -->

	<%
		out.print("<table width=" + 800 + " border=" + 1 + ">");

		for (int i = 0; i <= 9; ++i) {
			out.print("<tr>");
			for (int j = 0; j <= 9; ++j) {
				if (i == 0 && j == 0) {
					out.print("<td></td>");
				} else if (j == 0) {
					out.print("<td>" + i + "단</td>");
				} else if (i == 0) {
					out.print("<td>X" + j + "</td>");
				} else {
					out.print("<td>" + i + " x " + j + " = " + (i * j) + "</td>");
				}
			}
			out.print("</tr>");
		}
		out.print("</table>");
	%>



</body>
</html>