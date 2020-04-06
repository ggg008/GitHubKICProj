<%@page import="albumModel.AlbumCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="albumModel.AlbumBoardDAO"%>
<%@page import="albumModel.AlbumBoardTO"%>
<%@page import="java.io.File"%>

<%
	request.setCharacterEncoding("utf-8");

	AlbumBoardTO to = new AlbumBoardTO();
	to.setSeq(request.getParameter("seq"));
	to.setPassword(request.getParameter("password"));
	to.setImgname(request.getParameter("imgname"));

	AlbumBoardDAO dao = new AlbumBoardDAO();
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
	
	AlbumCommentDAO cdao = new AlbumCommentDAO();
	cdao.commentDeleteOkByParent(to.getSeq());
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