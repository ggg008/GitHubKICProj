<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <form action="upload_ok.jsp" -->
	<form action="http://192.168.0.20:8080/UploadEx01/upload_ok.jsp"
		method="post" enctype="multipart/form-data">
		파일 <input type="file" name="upload1" /> <input type="submit"
			value="파일전송" />
	</form>
</body>
</html>