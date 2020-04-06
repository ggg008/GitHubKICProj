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
.ui-menu{
	width: 150px;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#menu').menu();
	})
</script>
</head>
<body>
	<ul id="menu">
		  <li>
		    <div><span class="ui-icon ui-icon-disk"></span>Save</div>
		  </li>
		  <li>
		    <div><span class="ui-icon ui-icon-zoomin"></span>Zoom In</div>
		  </li>
		  <li>
		    <div><span class="ui-icon ui-icon-zoomout"></span>Zoom Out</div>
		  </li>
		  <li class="ui-state-disabled">
		    <div><span class="ui-icon ui-icon-print"></span>Print...</div>
		  </li>
		  <li>
		    <div>Playback</div>
		    <ul>
		      <li>
		        <div><span class="ui-icon ui-icon-seek-start"></span>Prev</div>
		      </li>
		      <li>
		        <div><span class="ui-icon ui-icon-stop"></span>Stop</div>
		      </li>
		      <li>
		        <div><span class="ui-icon ui-icon-play"></span>Play</div>
		      </li>
		      <li>
		        <div><span class="ui-icon ui-icon-seek-end"></span>Next</div>
		      </li>
		    </ul>
		  </li>
		  <li>
		    <div>Learn more about this menu</div>
		  </li>
	</ul>
 
</body>
</html>

