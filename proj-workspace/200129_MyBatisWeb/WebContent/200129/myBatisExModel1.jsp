<%@page import="model1.DeptDAO"%>
<%@page import="model1.DeptTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptTO> list = dao.selectList();

	StringBuffer sbHtml = new StringBuffer();
	sbHtml.append("<table width='600' border='1'>");
	for (DeptTO dto : list) {
		sbHtml.append("<tr>");
		sbHtml.append("<td>" + dto.getDeptno() + "</td>");
		sbHtml.append("<td>" + dto.getDname() + "</td>");
		sbHtml.append("<td>" + dto.getLoc() + "</td>");
		sbHtml.append("</tr>");
	}
	sbHtml.append("</table>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=sbHtml%>
</body>
</html>