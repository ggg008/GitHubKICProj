<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <form action="http://192.168.0.20:8080/UploadEx01/upload_ok.jsp" -->
	<form action="upload2_ok.jsp"
		method="post" enctype="multipart/form-data">
		데이터 1 <input type="text" name="data1"><br><br>
		데이터 2 <input type="text" name="data2"><br><br>
		파일 <input type="file" name="upload1" /> <input type="submit"
			value="파일전송" />
	</form>
</body>
</html>