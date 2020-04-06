<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath().substring(request.getContextPath().length())  %></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		document.getElementById('btn1').onclick = function() {
			//하나만 찍힘을 주의
			//console.log( $('img').attr('src') );
			
			//var attr = $('img').attr('width');
			//console.log(attr);
			
			$('img').each(function(i, element) {				
				console.log( $(this).attr('src') );
			});
			
		};
		
		document.getElementById('btn2').onclick = function() {
			//$('img').attr('width', 100);
			
			/* 
			$('img').attr('width', function(index) {
				console.log(index);
				return (index + 1) * 100;
			});
			*/
			 
			$('img').attr({
				width: function(index) {
					return (index + 1) * 100;
				},
				height: 100,
				dataIndex : 10
			});
			 
		};
		
		
		document.getElementById('btn3').onclick = function() {
			//$('img').removeAttr('height');
			$('img').removeAttr('dataIndex');
			
		};
	});
</script>
</head>
<body>
<button id="btn1">속성 내용</button>
<button id="btn2">속성 수정</button>
<button id="btn3">속성 삭제</button>
<br><hr>
<img src="..\imgs\Jellyfish.jpg" width="150">
<img src="..\imgs\Lighthouse.jpg" width="150">
<img src="..\imgs\Tulips.jpg" width="150">

</body>
</html>

