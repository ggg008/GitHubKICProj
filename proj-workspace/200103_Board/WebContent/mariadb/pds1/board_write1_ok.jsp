<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="modelPaging.BoardDAO"%>
<%@ page import="modelPaging.BoardTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%
	request.setCharacterEncoding("utf-8");

	//경로 : 윈도우는 대소문자 안가리지만 유닉스 리눅스 맥ios는 대소문자를 가림
	String uploadPath = "C:/MyCloud/OneDrive/java/jsp-workspace/200103_Board/WebContent/upload";
	int maxFileSize = 1024 * 1024 * 2; // 2mb

	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, "utf-8",
			new DefaultFileRenamePolicy()/*중복 시 이름재정의*/);

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

	String mail = "";
	if (!multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")) {
		mail = multi.getParameter("mail1") + "@" + multi.getParameter("mail2");
	}

	String content = multi.getParameter("content");
	content = multi.getParameter("content").replaceAll("\n", "<br>");
	content = multi.getParameter("content").replaceAll(" ", "&nbsp;");

	//System.out.println(content);

	BoardTO to = new BoardTO();
	to.setSubject(multi.getParameter("subject"));
	to.setWriter(multi.getParameter("writer"));
	to.setPassword(multi.getParameter("password"));
	to.setWip(request.getRemoteAddr());
	to.setMail(mail);
	to.setContent(content);
	to.setFilename(multi.getFilesystemName("upload"));
	to.setFilesize(file != null ? String.valueOf(file.length()) : "0");

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