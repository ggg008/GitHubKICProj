<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath() %></title>

<style type="text/css">
.high-light-0 {
	background-color: yellow;
}
.high-light-1 {
	background-color: orange;
}
.high-light-2 {
	background-color: blue;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		document.getElementById('btn1').onclick = function() {
			
			//함수중심 프로그램 (제어문 in 함수)
			/* 
			$('h2').each(function(i, element) {
				$(this).addClass('high-light-' + i);
			})
			 */
			 
			 $('h2').addClass(function(index) {
				console.log(index);
				$(this).addClass('high-light-' + index);
			})
		}
		
		document.getElementById('btn2').onclick = function() {
			$('h2').removeClass('high-light');
		}
		
		document.getElementById('btn3').onclick = function() {
			$('h2').toggleClass('high-light');
		}
	})
</script>
</head>
<body>
	<button id="btn1">클래스 추가</button>
	<button id="btn2">클래스 제거</button>
	<button id="btn3">클래스 토글</button>
	<br>
	<hr>
	<h2 id="i1">item - 0</h2>
	<h2 id="i2">item - 1</h2>
	<h2 id="i3">item - 2</h2>

</body>
</html>

