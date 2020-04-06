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
		$(window).scroll(function() {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			
			console.log(scrollHeight + ' : ' + documentHeight);
			
			if (scrollHeight >= documentHeight) {
				for (var i = 0; i < 10; i++) {
					//$('<h1>Infinity Scroll-'+ i +'</h1>').appendTo('body');
					$('<h1>'+ scrollHeight + ' : ' + documentHeight + '</h1>').appendTo('body');
				}
			}
		})
	})

	// 테스트를 위해 내부에 공간을 채워둡니다
	$(document).ready(function() {
		for (var i = 0; i < 20; i++) {
			$('<h1>Infinity Scroll '+ i +'</h1>').appendTo(' body');
		}
	});
</script>
</head>
<body>

</body>
</html>

