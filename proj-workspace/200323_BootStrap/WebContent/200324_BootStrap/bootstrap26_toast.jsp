<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= request.getServletPath() %></title>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> <!-- 라이브러리 순서 다를시 에러 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
		  $('.toast').toast('show');
	})	
</script>
</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_toast.asp
-->

<body>

	<div class="container">
		<h3>Toast Example</h3>
		<p>In this example, we use data-autohide="false" to show the toast
			by default. You can close it by clicking on the close (x) icon inside
			the toast header.</p>

		<div class="toast" data-autohide="false">
			<div class="toast-header">
				<strong class="mr-auto text-primary">Toast Header</strong> <small
					class="text-muted">5 mins ago</small>
				<button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
			</div>
			<div class="toast-body">Some text inside the toast body</div>
		</div>
	</div>

</body>
</html>

