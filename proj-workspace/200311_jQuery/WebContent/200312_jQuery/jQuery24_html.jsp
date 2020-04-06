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
	$(document).ready(function() {
		document.getElementById('btn1').onclick = function() {
			/* 			
			var result = document.getElementById('result');
			
			console.log(result.innerHTML);
			 */
			 
			console.log( $('#result1').html());
		};
		
		document.getElementById('btn2').onclick = function() {			
			//$('#result1').html('<b> Hello jQuery</b>');	
			//$('#result2').text('<b> Hello jQuery</b>');
			
			//$('div').html('<b> Hello jQuery</b>');
			
			$('div').html(
				function(i, element) {
					return '<b> Hello jQuery'+ i +'</b>';				
				}
			)  
		};
	});
</script>
</head>
<body>

	<button id="btn1">내용</button>
	<button id="btn2">내용</button>
	<br>
	<hr>
	<div id="result1"><font color="red">출력될 내용</font></div>
	<div id="result2">출력될 내용</div>
	<div id="result3">출력될 내용</div>

</body>
</html>

