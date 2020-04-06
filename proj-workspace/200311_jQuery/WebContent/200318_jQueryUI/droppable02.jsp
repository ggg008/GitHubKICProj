
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

#draggable1, #draggable2 {
	width: 100px;
	height: 100px;
	padding: 0.5em;
	float: left;
	margin: 10px 10px 10px 0;
}

#droppable {
	width: 150px;
	height: 150px;
	padding: 0.5em;
	float: left;
	margin: 10px;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$("#draggable1").draggable({
			revert: "valid"
		});
		$("#draggable2").draggable({
			revert: "invalid"
		});
		
		
		$("#droppable").droppable({
			drop: function(event, ui) {
				$(this).addClass("ui-state-highlight").find("p").html("드롭!");
			},
			out: function() {
				$("#droppable").find("p").html("아웃!");
				$(this).removeClass("ui-state-highlight");
			}
			
			
		});
	})
</script>
</head>
<body>
	<!-- revert 영역안에 들어가지 않으면 되돌아감 -->
	<div id="draggable1" class="ui-widget-content">
	  <p>Drag me to my target1</p>
	</div>
	<div id="draggable2" class="ui-widget-content">
	  <p>Drag me to my target2</p>
	</div>
	 
	<div id="droppable" class="ui-widget-header">
	  <p>Drop here</p>
	</div>

</body>
</html>