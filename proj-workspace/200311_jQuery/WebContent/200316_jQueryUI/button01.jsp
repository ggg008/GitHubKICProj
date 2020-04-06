<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath().substring(request.getContextPath().length()) %></title>
<link rel="stylesheet" href="../css/base/jquery-ui.css"/>
<style type="text/css">
	body { font-size :80%};
</style> 

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#btn1').button();
		$('input[type="submit"]').button();
		$('a').button();
		$('div').button();
	})	
</script>
</head>
<body>
	<button>난 버튼</button><br><br>
	<button id="btn1">난 버튼</button><br><br>
	<input type="submit" value="난 버튼"/><br><br>
	<a href="#">난 버튼</a><br><br>
	<div id="btn2">난 버튼</div>
</body>
</html>

