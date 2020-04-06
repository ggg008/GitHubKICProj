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
		//jQuery -> dom에 대한 접근 -> CSS Selector와 거의 동일
		
		/*
		전체 셀렉터
		*/
		//$('*').css('color', 'red');
		
		/*
		태그 셀렉터
		*/
		//$('h1').css('color', 'red');
		//$('h' + '3').css('color', 'red');
		
		var selector = 'h1';
		var attribute = 'color';
		var value = 'green';
		//$(selector).css(attribute, value);
		
		//$('h2').css('color', 'green');		
		$('h2, h3').css('color', 'red');
				
		/*
		아이디 셀렉터
		*/
		$('#hj4').css('color', 'blue');
		
		/*
		클래스
		*/
		$('.c1').css('color', 'purple');
		$('.c1.c2').css('color', 'orange');
	})	
</script>
</head>
<body>
	<h1> Hello jQuery 1 </h1>
	<h2 id="hj2"> Hello jQuery 2 </h2>
	<h3> Hello jQuery 3 </h3>
	<h1 id="hj4"> Hello jQuery 4 id</h1>
	<h1 id="hj5"> Hello jQuery 5 id</h1>
	
	<h1 class="c1"> Hello jQuery 6 class </h1>	
	<h1 class="c1"> Hello jQuery 7 class </h1>
	<h1 class="c1 c2"> Hello jQuery 8 class </h1>
	<h1 class="c2"> Hello jQuery 9 class </h1>
	
</body>
</html>