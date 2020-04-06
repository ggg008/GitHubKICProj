<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		/* 
		속성 선택기 p21
		 */
		//$('input[type="text"]').css('background', 'red');//완전동일 조건
		//$('input[type^="te"]').css('background', 'blue');//시작값동일 조건 
		
		/*
		필터 선택기
		*/
		$('input:text').css('background', 'green');
		$('input:password').css('background', 'yellow');
		
		
	})	
</script>
</head>
<body>
	<input type="text"/><br>
	<input type="password"/><br>	
	
	
</body>
</html>
