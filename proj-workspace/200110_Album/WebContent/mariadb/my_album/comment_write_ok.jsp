<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="albumModel.AlbumCommentTO"%>
<%@page import="albumModel.AlbumCommentDAO"%>

<%
	request.setCharacterEncoding("utf-8");

	String cpage = request.getParameter("cpage");
	String seq = request.getParameter("seq");
	
	AlbumCommentTO cto = new AlbumCommentTO();
	cto.setWriter(request.getParameter("cwriter"));
	cto.setPassword(request.getParameter("cpassword"));
	cto.setContent(request.getParameter("ccontent"));
	cto.setWip(request.getRemoteAddr());
	cto.setParentseq(seq);
	
	AlbumCommentDAO cdao = new AlbumCommentDAO();
	int flag = cdao.commentWriteOk(cto);

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		//out.println("alert('글쓰기에 성공했습니다.');");
		out.println("location.href='board_view1.jsp?cpage="+cpage+"&seq="+seq+"';");
	} else {
		out.println("alert('댓글쓰기에 실패했습니다.');");
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