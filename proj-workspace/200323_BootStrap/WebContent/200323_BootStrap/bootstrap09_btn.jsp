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
https://www.w3schools.com/bootstrap4/bootstrap_buttons.asp
-->

<body>

	<div class="container-fluid">
		<h2>Button Styles</h2>
		<button type="button" class="btn">Basic</button>
		<button type="button" class="btn btn-primary">Primary</button>
		<button type="button" class="btn btn-secondary">Secondary</button>
		<button type="button" class="btn btn-success">Success</button>
		<button type="button" class="btn btn-info">Info</button>
		<button type="button" class="btn btn-warning">Warning</button>
		<button type="button" class="btn btn-danger">Danger</button>
		<button type="button" class="btn btn-dark">Dark</button>
		<button type="button" class="btn btn-light">Light</button>
		<button type="button" class="btn btn-link">Link</button>
	</div>
	<hr>
	<div class="container-fluid">
		<h2>Button Sizes</h2>
		<button type="button" class="btn btn-primary btn-lg">Large</button>
		<button type="button" class="btn btn-primary btn-md">Default</button>
		<button type="button" class="btn btn-primary btn-sm">Small</button>
	</div>
	<hr>
	<div class="container-fluid">
		<h2>Spinner Buttons</h2>
		<p>Add spinners to buttons:</p>

		<button class="btn btn-primary">
			<span class="spinner-border spinner-border-sm"></span>
		</button>

		<button class="btn btn-primary">
			<span class="spinner-border spinner-border-sm"></span> Loading..
		</button>

		<button class="btn btn-primary" disabled>
			<span class="spinner-border spinner-border-sm"></span> Loading..
		</button>

		<button class="btn btn-primary" disabled>
			<span class="spinner-grow spinner-grow-sm"></span> Loading..
		</button>
	</div>
	<hr>
	<!-- 에러 -->
	<div class="container-fulid">
		<h2>Nesting Button Groups</h2>
		<p>Nest button groups to create dropdown menus:</p>
		<div class="btn-group">
			<button type="button" class="btn btn-primary">Apple</button>
			<button type="button" class="btn btn-primary">Samsung</button>
			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">Sony</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Tablet</a> 
					<a class="dropdown-item" href="#">Smartphone</a>
				</div>
			</div>
		</div>
	</div>	
	<hr>
	

</body>
</html>

