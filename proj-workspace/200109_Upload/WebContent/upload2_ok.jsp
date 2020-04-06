<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>

<%
	String uploadPath = "C:/MyCloud/OneDrive/java/jsp-workspace/200109_Upload/WebContent/upload";
	int maxFileSize = 1024 * 1024 * 2; // 2mb
	String encType = "utf-8";

	//전송 라이블러리 사용
	//리퀘스트 권한 이동(getParameter만)
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encType,
			new DefaultFileRenamePolicy()/*중복 시 이름재정의*/);

	//불가
	//String data1 = request.getParameter("data1");
	//String data2 = request.getParameter("data2");

	String data1 = multi.getParameter("data1");
	String data2 = multi.getParameter("data2");

	out.println("data1 : " + data1 + "<br>");
	out.println("data2 : " + data2 + "<br>");
	

	out.println("ip : " + request.getRemoteAddr() + "<br>");
	
	
	String imgName = multi.getFilesystemName("upload1");
	out.println(String.format("<img src='./upload/%s'>", imgName) );
%>