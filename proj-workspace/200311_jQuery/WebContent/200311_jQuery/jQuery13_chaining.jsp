<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>jq13</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 
		$('h3:even').css({
			backgroundColor : 'black',
			color : 'white'
		});
		 */

		/* 
		$('h3').filter(':even').css({
			backgroundColor : 'black',
			color : 'white'
		});
		 */

		$('h3').filter(function(index, item) {
			console.log(item);

			//조건을 새롭게 생성 
			return index % 2 == 0;
		}).css({
			backgroundColor : "yellow",
			color : "green"
		}).filter(function(index, item) {
			return index == 0;
		}).css({
			backgroundColor : "black",
			color : "red"
		});

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
