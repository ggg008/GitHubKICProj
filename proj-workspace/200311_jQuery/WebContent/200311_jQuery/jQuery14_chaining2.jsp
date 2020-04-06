<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>jq14</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 
		$('h3').css({
			backgroundColor : "orange",
		}).filter(':even').css({
			color : "red"
		});
		 */
		 
		/* 		 
		$('h3').css({
			backgroundColor : "orange",
		});

		$('h3').filter(':even').css({
			color : "red"
		});

		$('h3').filter(':odd').css({
			color : "white"
		});
 		*/		
		//위와 같이 한줄로 표현
		$('h3').css({
			backgroundColor : "orange",
		})
		.filter(':even').css({
			color : "red"
		}).end() //종료하고 처음부터 탐색 재시작 X (한단계 전으로)
		.filter(':odd').css({
			color : "white"
		});

	});
</script>
</head>
<body>
	<h3>Header-0</h3>
	<h3>Header-l</h3>
	<h3>Header-2</h3>
	<h3>Header-3</h3>
	<h3>Header-4</h3>
	<h3>Header-5</h3>
</body>
</html>
