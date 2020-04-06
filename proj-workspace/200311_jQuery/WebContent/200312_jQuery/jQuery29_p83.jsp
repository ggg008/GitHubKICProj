<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<style type="text/css">
	.reverse { background-color: black; color: white;}
</style>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		// 이벤트를 연결합니다
		$('h3').on('click', function() {
			$(this).html(function(index, html) {
				return html + '+';
			})
		})
		// 이벤트를 연결합니다
		$('h3').on({
			mouseenter : function() {
				$(this).addClass('reverse');
			},
			mouseleave : function() {
				$(this).removeClass('reverse');
			}
		})
	})
</script>
</head>
<body>
	<h3>Header-0</h3>
	<h3>Header-l</h3>
	<h3>Header-2</h3>
</body>
</html>

