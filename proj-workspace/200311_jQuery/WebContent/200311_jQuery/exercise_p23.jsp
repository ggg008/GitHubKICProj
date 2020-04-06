<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>exercise_p23</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		// 5초 후에 코드를 실행합니다
		setTimeout(function() {
			// 변수를 선언합니다.
			var value = $('select > option:selected').val();
			
			// 출럭합니다
			alert(value);
		}, 5000);
	})
</script>
</head>
<body>
	<select>
		<option>Apple</option>
		<option>Bag</option>
		<option>Cat</option>
		<option>Dog</option>
		<option>Elephant</option>
	</select>
</body>
</html>