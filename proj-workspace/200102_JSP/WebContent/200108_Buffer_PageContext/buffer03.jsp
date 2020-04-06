<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");

	out.println("buffer03.jsp");

	String url = request.getParameter("url");

	RequestDispatcher dispatcher = null;
	
	if (url == null || url.equals("a")) {
		dispatcher = request.getRequestDispatcher("./html/a.jsp");
	} else if (url.equals("b")) {
		dispatcher = request.getRequestDispatcher("./html/b.jsp");
	}
	dispatcher.forward(request, response);
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