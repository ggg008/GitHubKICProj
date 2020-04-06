<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="albumModel.AlbumBoardDAO"%>
<%@page import="albumModel.AlbumBoardTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%
	request.setCharacterEncoding("utf-8");

	AlbumBoardDAO dao = new AlbumBoardDAO();

	String uploadPath = dao.getUploadPath();
	int maxFileSize = dao.getMaxFileSize();

	try {

		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, "utf-8",
				new DefaultFileRenamePolicy()/*중복 시 이름재정의*/);

		File imgFile = null;
		if (multi.getFilesystemName("upload") != null) {

			out.println(multi.getFilesystemName("upload") + "<br>");//저장된 파일명
			out.println(multi.getOriginalFileName("upload") + "<br>"); //원 파일명

			imgFile = multi.getFile("upload");
			out.println(imgFile.length() + "<br>");
		}

		String mail = "";
		if (!multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")) {
			mail = multi.getParameter("mail1") + "@" + multi.getParameter("mail2");
		}

		String content = multi.getParameter("content");
		content = multi.getParameter("content").replaceAll("\n", "<br>");
		content = multi.getParameter("content").replaceAll(" ", "&nbsp;");

		//System.out.println(content);

		AlbumBoardTO to = new AlbumBoardTO();
		to.setSubject(multi.getParameter("subject"));
		to.setWriter(multi.getParameter("writer"));
		to.setPassword(multi.getParameter("password"));
		to.setWip(request.getRemoteAddr());
		to.setContent(content);
		to.setMail(mail);
		to.setImgname(multi.getFilesystemName("upload"));
		to.setImgsize(imgFile != null ? String.valueOf(imgFile.length()) : "0");

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
		
	} catch (IOException e) {
		out.println("<script type='text/javascript'>");
		out.println("alert('파일 사이즈가 최대 크기 " + maxFileSize + "보다 큽니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
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