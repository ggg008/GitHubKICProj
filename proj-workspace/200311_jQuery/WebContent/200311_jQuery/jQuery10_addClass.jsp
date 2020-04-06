<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>jQuery10</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//each, addClass(클래스 추가)
		$('h2').each(function(index, item) {
			//$(item).addClass( 'high-light-' + index);
			$(this).addClass( 'high-light-' + index);
		})

	})
</script>
<style type="text/css">
	.high-light-0{ background-color: yellow; }
	.high-light-1{ background-color: orange; }
	.high-light-2{ background-color: blue; }
	.high-light-3{ background-color: green; }
	.high-light-4{ background-color: red; }

</style>

</head>
<body>

	<h2>item - 0</h2>
	<h2>item - 1</h2>
	<h2>item - 2</h2>
	<h2>item - 3</h2>
	<h2>item - 4</h2>
	
</body>
</html>