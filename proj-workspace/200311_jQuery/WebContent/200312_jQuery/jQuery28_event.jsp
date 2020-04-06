<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath().substring(request.getContextPath().length()) %></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		/* 
		$('#btn1').on('click', function() {
			console.log('btn1 click');
		})
		
		$('#btn2').on('click', function() {
			console.log('btn2 click');
		})
		 */
		 
		/*  
		//$('button').on('click', function() {
		$('button').on('mouseover', function() {
			//console.log( $(this).attr('id'));
						
			if($(this).attr('id') == 'btn1') {
				console.log('btn1 click');
			} else{
				console.log('btn2 click');
			} 				
		})
		 */
		 
		$('#btn1').click( function() {
			console.log('btn1 click');
		})
		
	})	
</script>
</head>
<body>
	
	<button id="btn1">난 버튼 1</button>
	<button id="btn2">난 버튼 2</button>
	
	
</body>
</html>

