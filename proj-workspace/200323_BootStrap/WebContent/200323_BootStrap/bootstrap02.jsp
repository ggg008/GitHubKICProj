<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath() %></title>

<link rel="stylesheet" href="../css/bootstrap.css"/>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
	})	
</script>

</head>

<!-- https://www.w3schools.com/bootstrap4/bootstrap_containers.asp -->

<body>

<div class="jumbotron text-center">
  <h1>My First Bootstrap Page</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>

<div class="container-fluid">
<!--
<div class="container">
<div class="container-fluid"> 
 -->
	<div class="row">
		<div class="col">
			<h1>My First Bootstrap Page</h1>
  			<p>This is some text.</p>
  			<p>Resize this responsive page to see the effect!</p>
  			<p>Resize this responsive page to see the effect!</p>
		</div>
		<!-- <div class="col">Resize this responsive page to see the effect!</div>
		<div class="col">Resize this responsive page to see the effect!</div> -->
	</div>
</div>
  
</body>
</html>

