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
		// .image 의 크기를 조정합니다
		$('img').css('width', 250);
		// 함수를 2초마다 실행합니다
		setInterval(function() {
			// 첫 번째 이미지를 마지막으로 보냄니다
			$('img').first().appendTo('body');
		}, 500);
	})
</script>
</head>
<body>
	<img src="..\imgs\Chrysanthemum.jpg" width="150">
	<img src="..\imgs\Hydrangeas.jpg" width="150">
	<img src="..\imgs\Jellyfish.jpg" width="150">
	<img src="..\imgs\Lighthouse.jpg" width="150">
	<img src="..\imgs\Tulips.jpg" width="150">
</body>
</html>

