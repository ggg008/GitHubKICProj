<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>p44</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('h1').each(function() {
			if ($(this).is('.select')) {
				$(this).css('background', 'orange');
			}
		});
	});
</script>
</head>
<body>
	<h1 class="select">Header-0</h1>
	<h1>Header-1</h1>
	<h1 class="select">Header-2</h1>
</body>
</html>
