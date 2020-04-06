<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		/* 
		$('h2').on(function() {
				alert('click');
				$(this).off();
			}
		)
		 */

		$('h2').one('click', function() {
			alert('click');
		})
	})
</script>
</head>
<body>
	<h2>Header-0</h2>
	<h2>Header-l</h2>

</body>
</html>

