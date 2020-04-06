<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Title</title>
</head>
<body>
	<h3>회원 정보</h3>
	<form action="queryTest" method="get"><!-- quertTest(임의의 이름)(jsp문서)로 전송 -->
		ID : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		이름 : <input type="text" name="name"><br>
		취미 : 
			<input type="checkbox" name="hobby" value="climbing"> 등산
			<input type="checkbox" name="hobby" value="sport">운동
			<input type="checkbox" name="hobby" value="reading">독서
		성별 :
			<input type="checkbox" name="hobby" value="traveling">여행<br>
			<input type="radio" name="gender" value="male">남자
			<input type="radio" name="gender" value="female">여자<br>
		종교 : 
			<select name="religion">
				<option value="Christianity"> 기독교
				<option value="Buddhism"> 불교
				<option value="Catholicism"> 천주교
				<option value="atheism"> 무교
			</select> <br>
		자기소개 : <br>
			<textarea rows="10" cols="30" name="introduction"></textarea><br>
			
		<input type="submit" value="전송">
		<input type="reset" value="지우기">
			
	</form>

</body>
</html>