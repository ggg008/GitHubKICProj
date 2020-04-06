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

#draggable {
	width: 150px;
	height: 150px;
	padding: 0.5em;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//$('#draggable').draggable();
		$('#draggable').draggable({
			create: function() {
				console.log('create');
			},
			start: function() {
				console.log('start');
			},
			drag: function() {
				console.log('drag');
			},
			stop: function() {
				console.log('stop');
			}
			
			
		});

	})
</script>
</head>
<body>

	<div id="draggable" class="ui-widget-content">
		<p>드래그 영역</p>
	</div>

</body>
</html>