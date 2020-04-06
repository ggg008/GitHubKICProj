<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>

<style type="text/css">
.reverse {
	background-color: black;
	color: white;
}
</style>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		/* 
		$('h2').on({
			mouseenter : function() {
				$(this).addClass('reverse');
			},
			mouseleave : function() {
				$(this).removeClass('reverse');
			}
		})
		 */
		$('h2').hover(function() {
			$(this).addClass('reverse');
		}, function() {
			$(this).removeClass('reverse');
		});

	})
</script>
</head>
<body>
	<h2>Header-0</h2>
	<h2>Header-l</h2>
</body>
</html>

