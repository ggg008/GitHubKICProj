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
		// 변수를 선언합니다
		var color = [ 'red', 'gray', 'purple' ];
		// 문서 객체의 스타일을 변경합니다'
		$('h3').css('color', function(index) {
			return color[index];
		});

		$('h3').css({
			color : function(index) {
				return color[index]
			},
			backgroundColor : "black"
		})

	});
</script>
</head>
<body>
	<h3>Header-0</h3>
	<h3>Header-l</h3>
	<h3>Header-2</h3>
</body>
</html>

