<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getServletPath() %></title>
<style type="text/css">
.carousel-inner img{
	width: 100%;
	height: 100%;	
} 
</style>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
	})	
</script>
</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_carousel.asp
-->

<body>

	<div id="demo" class="carousel slide" data-ride="carousel">
		<!-- indicator -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="..\img\la.jpg">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>Hello Hi!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="..\img\chicago.jpg">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Hello Hi!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="..\img\ny.jpg">
				<div class="carousel-caption">
					<h3>NewYork</h3>
					<p>Hello Hi!</p>
				</div>
			</div>
		</div>
		
		<!-- controls -->
		<a href="#demo" class="carousel-control-prev" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a href="#demo" class="carousel-control-next" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
		
		
	</div>

</body>
</html>

