<%@page import="albumModel.AlbumCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="albumModel.AlbumCommentDAO"%>
<%@page import="albumModel.AlbumCommentTO"%>
<%@page import="java.io.File"%>

<%
	request.setCharacterEncoding("utf-8");

	String cpage = request.getParameter("cpage");
	String seq = request.getParameter("seq");	
	String commentno = request.getParameter("commentno");
	String password = request.getParameter("comment_del_password");
	
	//out.println(commentno);
	//out.println(password);
	
	AlbumCommentTO cto = new AlbumCommentTO();
	cto.setCommentno(commentno);
	cto.setPassword(password);
	cto.setParentseq(seq);

	AlbumCommentDAO cdao = new AlbumCommentDAO();
	int flag = cdao.commentDeleteOk(cto);

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('댓글삭제에 성공했습니다.');");
		out.println("location.href='board_view1.jsp?cpage=" + cpage + "&seq=" + seq + "';");
	} else if (flag == 1) {
		out.println("alert('비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('댓글삭제에 실패했습니다.');");
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