<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(
			function() {
				//$('<h2>Hello jQuery</h2>').appendTo('body');
				//$('<h2></h2>').html('Hello jQuery').appendTo('body');

				document.getElementById('btn1').onclick = function() {
					/* 
					$() 선택과 생성 기능
					선택 : 일반문자열 입력
					생성 : 태그형 문자열 입력
					 */
					 
					//$('<h2></h2>').html('Hello jQuery').appendTo('div');
					//$('<img/>').attr('src', '../imgs/Tulips.jpg').appendTo('div');
					/* 
					$('<img/>').attr('src', '../imgs/Tulips.jpg').attr('width',
							'100').appendTo('div');
					 */
					
					 
					$('<img/>', {
						src : '../imgs/Tulips.jpg',
						width: 100						
					}).appendTo('div');
					 
				}
			})
</script>
</head>
<body>

	<button id="btn1">내용</button>
	<br>
	<hr>
	<div></div>

</body>
</html>

