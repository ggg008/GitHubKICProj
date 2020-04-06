<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//문자 인코딩
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	p133_output.jsp
	<hr>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		//String hobby = request.getParameter("hobby");
		String[] hobbys =  request.getParameterValues("hobby");
		String gender = request.getParameter("gender");
		String religion = request.getParameter("religion");
		String introduction = request.getParameter("introduction");

		out.println("ID : " + id + "<br>");
		out.println("비밀번호 : " + pwd + "<br>");
		out.println("이름 : " + name + "<br>");
		for (int i = 0; i < hobbys.length; ++i) {
			out.println("취미 : " + hobbys[i] + "<br>");
		}

		out.println("성별 : " + gender + "<br>");
		out.println("종교 : " + religion + "<br>");
		out.println("자기소개 : " + introduction + "<br>");
	%>
</body>
</html>