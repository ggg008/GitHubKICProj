<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- pool 추가된 부분(DriverManager대신 사용) -->
<%@ page import="model1.BoardDAO"%>
<%@ page import="model1.BoardTO"%>

<%
	request.setCharacterEncoding("utf-8");

	String mail = "";
	if (!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
		mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	}

	String content = request.getParameter("content");
	content = request.getParameter("content").replaceAll("\n", "<br>");
	content = request.getParameter("content").replaceAll(" ", "&nbsp;");

	//System.out.println(content);

	BoardTO to = new BoardTO();
	to.setSubject(request.getParameter("subject"));
	to.setWriter(request.getParameter("writer"));
	to.setPassword(request.getParameter("password"));
	to.setWip(request.getRemoteAddr());
	to.setMail(mail);
	to.setContent(content);
	

	BoardDAO dao = new BoardDAO();
	int flag = dao.boardWriteOk(to);

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('글쓰기에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");
	} else {
		out.println("alert('글쓰기에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
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