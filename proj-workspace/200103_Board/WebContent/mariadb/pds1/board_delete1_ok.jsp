<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="modelPaging.BoardDAO"%>
<%@page import="modelPaging.BoardTO"%>
<%@page import="java.io.File"%>

<%
	request.setCharacterEncoding("utf-8");

	BoardTO to = new BoardTO();
	to.setSeq(request.getParameter("seq"));
	to.setPassword(request.getParameter("password"));
	to.setFilename(request.getParameter("filename"));

	BoardDAO dao = new BoardDAO();
	int flag = dao.boardDeleteOk(to);

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('글삭제에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");
	} else if (flag == 1) {
		out.println("alert('비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('글삭제에 실패했습니다.');");
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