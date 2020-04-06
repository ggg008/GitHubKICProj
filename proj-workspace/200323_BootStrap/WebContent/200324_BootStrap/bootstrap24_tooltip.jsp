<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= request.getServletPath() %></title>

<!--
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>  

-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
		$('[data-toggle="tooltip"]').tooltip(); 
	})	
</script>
</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_tooltip.asp
-->

<body>

<div class="container">
  <h3>Tooltip Example</h3>
  <p>The data-placement attribute specifies the tooltip position.</p>
  <a href="#" data-toggle="tooltip" data-placement="top" title="Hooray!">Top</a>
  <a href="#" data-toggle="tooltip" data-placement="bottom" title="Hooray!">Bottom</a>
  <a href="#" data-toggle="tooltip" data-placement="left" title="Hooray!">Left</a>
  <a href="#" data-toggle="tooltip" data-placement="right" title="Hooray!">Right</a>
</div>


</body>
</html>

