<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<link rel="stylesheet" href="../css/base/jquery-ui.css" />
<style type="text/css">
body {
	font-size: 80%
}

input[type=text] {
	padding: 5px;
	text-align: center;
	margin: 0px;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//$('#dialog').dialog();
		
		$('#dialog').dialog({
			autoOpen: false,
			modal: true,
			width: "500",
			height: "300",
			show: {
				effect: 'blind',
				duration: 500,
			},
			hide: {
				effect: 'explode',
				duration: 1000
			},
			buttons: {
				'취소': function() {
					alert('취소');
					$(this).dialog('close');
				},
				'확인': function() {
					alert('확인');
					$(this).dialog('close');
				}
			}
		});		
		
		$('#btn1').button().on('click', function() {
			$('#dialog').dialog('open');	
		});
		
		$('#btn2').button().on('click', function() {
			$('#dialog').dialog('close');	
		});
	})
</script>
</head>
<body>
<button id="btn1">open</button>
<button id="btn2">close</button>
<br>
<hr>
<div id="dialog" title="jQuery Dialog">
	<h1> Hello jQuery </h1>
</div>

</body>
</html>

