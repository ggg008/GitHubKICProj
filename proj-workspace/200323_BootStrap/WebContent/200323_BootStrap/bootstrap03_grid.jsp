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
https://www.w3schools.com/bootstrap4/bootstrap_grid_system.asp
-->

<body>

	<div class="container-fluid">
		<h1>Basic Grid Structure</h1>
		<p>Resize the browser window to see the effect.</p>
		<p>The first, second and third row will automatically stack on top
			of each other when the screen is less than 576px wide.</p>

		<div class="container-fluid">
			<!-- Control the column width, and how they should appear on different devices -->
			<div class="row">
				<div class="col-sm-8" style="background-color: yellow;">66.66%</div>
				<div class="col-sm-4" style="background-color: orange;">33.33%</div>
			</div>
			<br>

			<div class="row">
				<div class="col-sm-4" style="background-color: yellow;">33.33%</div>
				<div class="col-sm-4" style="background-color: orange;">33.33%</div>
				<div class="col-sm-4" style="background-color: yellow;">33.33%</div>
			</div>
			<br>

			<!-- Or let Bootstrap automatically handle the layout -->
			<div class="row">
				<div class="col-sm" style="background-color: yellow;">25%</div>
				<div class="col-sm" style="background-color: orange;">25%</div>
				<div class="col-sm" style="background-color: yellow;">25%</div>
				<div class="col-sm" style="background-color: orange;">25%</div>
			</div>
			<br>
			<!-- X 반응성 -->
			<div class="row">
				<div class="col" style="background-color: yellow;">25%</div>
				<div class="col" style="background-color: orange;">25%</div>
				<div class="col" style="background-color: yellow;">25%</div>
				<div class="col" style="background-color: orange;">25%</div>
			</div>
		</div>
	</div>

</body>
</html>

