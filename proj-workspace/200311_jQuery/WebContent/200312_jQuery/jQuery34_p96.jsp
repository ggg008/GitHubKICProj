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
		// 이벤트를 연결합니다.
		$('h1').click(function() {
			$(this).html(function(index, html) {
				return html + ' ★ ';
			});
		});
		// 1 초마다 함수를 실행합니다
		setInterval(function() {
			$('h1').last().trigger('click');
		}, 1000);

	})
</script>
</head>
<body>
	<h1>Start:</h1>
	<h1>Start:</h1>
</body>
</html>

