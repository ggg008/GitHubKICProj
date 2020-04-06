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
		$('#progressbar').progressbar({
			value : 50
		})
		
		$('#btn1').button().on('click', function() {
			console.log($('#progressbar').progressbar('value'));
			$('#progressbar').progressbar('value', $('#progressbar').progressbar('value') - 5, false);
		});
		$('#btn2').button().on('click', function() {
			console.log($('#progressbar').progressbar('value'));
			var value = $('#progressbar').progressbar('value');
			$('#progressbar').progressbar('value', value + 5);
			/* 
			$('#progressbar').progressbar( "option", "value", false );
			// ==
			$('#progressbar').progressbar({
				value : false
			})
			 */
		});
	})	
</script>
</head>
<body>
<div id="progressbar"></div>
<div id="btn1">감소(-5)</div>
<div id="btn2">증가(+5)</div>
</body>
</html>

