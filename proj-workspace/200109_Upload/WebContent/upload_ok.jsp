<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>

<%
	//조건
	//업로드 경로
	//제한 업로드
	//인코딩

	String uploadPath = "C:/MyCloud/OneDrive/java/jsp-workspace/200109_Upload/WebContent/upload";
	int maxFileSize = 1024 * 1024 * 2; // 2mb
	String encType = "utf-8";

	//전송 라이브러리 사용
	//http://www.servlets.com/cos/javadoc/com/oreilly/servlet/MultipartRequest.html
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encType,
			new DefaultFileRenamePolicy()/*중복 시 이름재정의*/);

	out.println(multi.getFilesystemName("upload1") + "<br>");//저장된 파일명
	out.println(multi.getOriginalFileName("upload1") + "<br>"); //원 파일명
	
	
	File file = multi.getFile("upload1");
	out.println(file.length() + "<br>");

	out.println("식별롬");
%>