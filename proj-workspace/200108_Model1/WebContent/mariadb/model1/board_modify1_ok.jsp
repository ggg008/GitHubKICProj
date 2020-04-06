<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>

<%
	request.setCharacterEncoding("utf-8");

	String seq = request.getParameter("seq");
	String mail = "";
	if (!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
		mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	}
	String content = request.getParameter("content");

	content = request.getParameter("content").replaceAll("\n", "<br>");
	content = request.getParameter("content").replaceAll(" ", "&nbsp;");

	/* 
		System.out.println(seq);
		System.out.println(writer);
		System.out.println(subject);
		System.out.println(password);
		System.out.println(mail);
		System.out.println(content);
	*/

	BoardDAO dao = new BoardDAO();
	BoardTO to = new BoardTO();

	to.setSeq(request.getParameter("seq"));
	to.setSubject(request.getParameter("subject"));
	to.setWriter(request.getParameter("writer"));
	to.setPassword(request.getParameter("password"));
	to.setMail(mail);
	to.setContent(content);

	int flag = dao.boardModifyOk(to);

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='board_view1.jsp?seq=" + seq + "';");
	} else {
		out.println("alert('글수정에 실패했습니다.');");
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