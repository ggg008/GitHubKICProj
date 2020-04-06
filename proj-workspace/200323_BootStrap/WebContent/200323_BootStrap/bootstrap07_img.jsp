<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath()%></title>

<link rel="stylesheet" href="../css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
	})
</script>

</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_images.asp
-->

<body>

	<div class="container">
		<div class="float-left">
			<h2>Rounded Corners</h2>
			<p>The .rounded class adds rounded corners to an image:</p>
			<img src="../img/cinqueterre.jpg" class="rounded" alt="Cinque Terre"
				width="304" height="236">
		</div>
		<div class="float-left">
			<h2>Circle</h2>
			<p>The .rounded-circle class shapes the image to a circle:</p>
			<img src="../img/cinqueterre.jpg" class="rounded-circle"
				alt="Cinque Terre" width="304" height="236">
		</div>
		<div class="mx-auto d-block">
			<h2>Thumbnail</h2>
			<p>The .img-thumbnail class creates a thumbnail of the image:</p>
			<img src="../img/cinqueterre.jpg" class="img-thumbnail" alt="Cinque Terre"
				width="304" height="236">
		</div>
	</div>

</body>
</html>

