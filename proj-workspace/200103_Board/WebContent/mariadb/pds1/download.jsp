
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>

<%
	String fileName = request.getParameter("filename");
	System.out.println(fileName);

	String downPath = "C:/MyCloud/OneDrive/java/jsp-workspace/200103_Board/WebContent/upload/" + fileName;
	out.clearBuffer();

	response.setContentType("application/octet-stream"); //contentType 변경
	response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8")); //헤더 변경

	FileInputStream fis = new FileInputStream(downPath);
	ServletOutputStream sos = response.getOutputStream();

	int data;
	byte readByte[] = new byte[4096];
	while ((data = fis.read(readByte, 0, readByte.length)) != -1) {
		sos.write(readByte, 0, data);
	}

	sos.flush();
	sos.close();
	fis.close();
%>
