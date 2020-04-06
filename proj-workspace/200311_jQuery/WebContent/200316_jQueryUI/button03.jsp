<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath().substring(request.getContextPath().length()) %></title>
<link rel="stylesheet" href="../css/vader/jquery-ui.css"/>
<style type="text/css">
	body { font-size :80%}
</style> 

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		
		$('#btn1').button().on('click', function(ㄷ) {
			alert('click');
			ㄷ.preventDefault();
		})		

		$('input[type="submit"]').button().on('click', function(e) {
			alert('click');
			// 기본 이벤트를 제거합니다
			e.preventDefault();
			//서밋 기능 제거
		})	

		$('a').button().on('click', function(e) {
			alert('click');
			// 기본 이벤트를 제거합니다
			//e.preventDefault();
			//서밋 기능 제거
		})
		
	})	
</script>
</head>
<body>
	<form action="test.jsp" method="get">
		<!-- 전송 기능 +FORM-->
		<button id="btn1">난 버튼</button>
		<br>
		<br> <input type="submit" value="난 버튼" /><br>
		<br>
	</form>
	
	<a href="https://www.naver.com">네이버</a><br><br>
</body>
</html>

