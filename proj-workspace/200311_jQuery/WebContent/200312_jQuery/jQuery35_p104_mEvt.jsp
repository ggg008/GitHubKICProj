<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<style type="text/css">
.outer {
	width: 200px;
	height: 200px;
	background: orange;
	padding: 50px;
	margin: 10px;
}

.inner {
	width: 100%;
	height: 100%;
	background: red;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
		$('.outer').mouseover(function() {
			$('body').append('<h5>MOUSEOVER</h5>');
		}).mouseenter(function() {
			$('body').append('<h5>MOUSENTER</h5>');
		})
	})
</script>
</head>
<body>
	<div class="outer">
		<div class="inner"></div>
	</div>
</body>
</html>

