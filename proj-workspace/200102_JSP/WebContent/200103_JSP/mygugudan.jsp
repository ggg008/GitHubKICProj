
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- WAS에 의해 없어지는 JSP 코드 -->
<%
	request.setCharacterEncoding("UTF-8");//문자 인코딩 //받는곳에선 항상 쓸것

	int startDan = Integer.parseInt(request.getParameter("startdan"));
	int endDan = Integer.parseInt(request.getParameter("enddan"));

	StringBuffer str = new StringBuffer("<table width='800' border='1'>");

	for (int i = 0; i <= endDan; ++i) {
		str.append("<tr>");
		for (int j = 0; j <= 9; ++j) {

			if (i == 0 && j == 0) {
				str.append("<td></td>");
			} else if (i == 0) {
				str.append("<td>X" + j + "</td>");
			} else if (j == 0) {
				str.append("<td>" + i + "단</td>");
			} else {
				str.append("<td>" + i + " x " + j + " = " + (i * j) + "</td>");
			}
		}
		str.append("</tr>");
		if (i == 0) {
			i = startDan;
		}
	}
	str.append("</table>");
	/* out.print(str.toString()); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=str.toString()%>
	<!-- out.print와 같음 -->
</body>
</html>