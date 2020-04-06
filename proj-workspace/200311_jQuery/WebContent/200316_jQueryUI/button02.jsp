<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath().substring(request.getContextPath().length()) %></title>
<link rel="stylesheet" href="../css/vader/jquery-ui.css"/>
<style type="text/css">
	body { font-size :80%};
</style> 

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#btn1').button().on('click', function() {
			alert('click');
		})
	})	
</script>
</head>
<body>
	<button id="btn1">난 버튼</button><br><br>
</body>
</html>

