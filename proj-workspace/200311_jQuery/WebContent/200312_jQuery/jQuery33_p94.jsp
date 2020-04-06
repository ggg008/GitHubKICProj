<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<style type="text/css">
#canvas {
	border: 1px solid black;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		/* 
		$('#canvas').on('click', function(e) {
			console.log(e.pageX + '/' + e.pageY);			
		})
		 */

		//canvas api
		var canvas = document.getElementById('canvas');
		var context = canvas.getContext('2d');

		//이벤트 연결
		$('#canvas').on({
			mousedown : function(e) {
				var x = e.pageX;
				var y = e.pageY;

				context.beginPath();
				context.moveTo(x, y);
			},
			mouseup : function(e) {
				var x = e.pageX;
				var y = e.pageY;

				context.lineTo(x, y);
				context.stroke();
			}
		});

	})
</script>
</head>
<body>
	<canvas id="canvas" width="700" height="400"></canvas>
</body>
</html>

