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
		$('#slider').slider({
			//orientation: "vertical",
			value : 50,
			min: 0,
			max: 499,
			change: function() {
				console.log('change');
			},
			slide: function(event, ui) {
				//console.log('slide');
				//console.log($(this).slider('value'));
				console.log(ui.value);
			}
		})

	})	
</script>
</head>
<body>
<div id="slider"></div>
</body>
</html>

