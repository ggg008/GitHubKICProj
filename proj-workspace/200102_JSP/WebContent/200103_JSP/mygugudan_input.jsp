<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Title</title>
</head>
<body>
	<h3>구구단 고고</h3>
	<form action="./mygugudan.jsp" method="get"><!-- quertTest(임의의 이름)(jsp문서)로 전송 -->
		시작단 : <input type="text" name="startdan"><br>
		끝단 : <input type="text" name="enddan"><br>
				
			
		<input type="submit" value="전송">
		<input type="reset" value="지우기">
			
	</form>

</body>
</html>