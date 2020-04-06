<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode</title>
</head>
<body>
	<form action="./Controller" method="post">
		<input type="hidden" name="action" value="zipcode_ok">
		동이름 : <input type="text" name="dong"> 
		<input type="submit" value="검색하기">
	</form>

</body>
</html>