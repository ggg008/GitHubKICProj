<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>p42</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('h3' ).eq(0).css( 'background', 'orange');
		$('h3' ).eq(-1).css ( 'background', 'red' );//뒤에서 1번
		
		console.log( $(document ).eq(0) );

	});
</script>
</head>
<body>
	<h3>Header-0</h3>
	<h3>Header-l</h3>
	<h3>Header-2</h3>
	<h3>Header-3</h3>
	<h3>Header-4</h3>
	<h3>Header-5</h3>
</body>
</html>
