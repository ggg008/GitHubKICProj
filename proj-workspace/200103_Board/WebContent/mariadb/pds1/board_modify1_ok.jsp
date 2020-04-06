<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="modelPaging.BoardDAO"%>
<%@page import="modelPaging.BoardTO"%>

<%
	request.setCharacterEncoding("utf-8");

	String uploadPath = "C:/MyCloud/OneDrive/java/jsp-workspace/200103_Board/WebContent/upload";
	int maxFileSize = 1024 * 1024 * 2; // 2mb

	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, "utf-8",
			new DefaultFileRenamePolicy()/*중복 시 이름재정의*/);

	String cpage = multi.getParameter("cpage");
	String seq = multi.getParameter("seq");
	String mail = "";
	if (!multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")) {
		mail = multi.getParameter("mail1") + "@" + multi.getParameter("mail2");
	}
	String content = multi.getParameter("content");

	content = multi.getParameter("content").replaceAll("\n", "<br>");
	content = multi.getParameter("content").replaceAll(" ", "&nbsp;");

	File file = null;
	if (multi.getFilesystemName("upload") != null) {
		out.println(multi.getFilesystemName("upload") + "<br>");//저장된 파일명
		out.println(multi.getOriginalFileName("upload") + "<br>"); //원 파일명

		file = multi.getFile("upload");
		out.println(file.length() + "<br>");

		if (maxFileSize < file.length()) {
			out.println("alert('파일 사이즈가 최대 크기 " + maxFileSize + "보다 큽니다.');");
			out.println("history.back();");
		}
	}
	if(multi.getParameter("filename") != null) {
		
	}

	/* 
		System.out.println(seq);
		System.out.println(writer);
		System.out.println(subject);
		System.out.println(password);
		System.out.println(mail);
		System.out.println(content);
	*/

	BoardTO to = new BoardTO();

	to.setSeq(multi.getParameter("seq"));
	to.setSubject(multi.getParameter("subject"));
	to.setWriter(multi.getParameter("writer"));
	to.setPassword(multi.getParameter("password"));
	to.setMail(mail);
	to.setContent(content);
	to.setFilename(multi.getFilesystemName("upload"));
	to.setFilesize(file != null ? String.valueOf(file.length()) : "0");

	BoardDAO dao = new BoardDAO();
	int flag = dao.boardModifyOk(to);

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='board_view1.jsp?cpage=" + cpage + "&seq=" + seq + "';");
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