<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath()%></title>

<link rel="stylesheet" href="../css/bootstrap.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

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
https://www.w3schools.com/bootstrap4/bootstrap_button_groups.asp
-->

<body>

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

</body>
</html>

