<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 호출  -->
<!-- 개발버전 -->
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>

<script type="text/javascript">
	// $ - jQuery 특수기호
	// 이벤트
	// $(document).ready() == window.onload
	
	// $(document).ready() 문서에서 1번만 사용하는게 좋다 ( jQuery 시작점 == main )
	$(document).ready(function() {
		console.log('Hello jQuery cdn');
	})	
	
	$(document).ready(
		function() {
				console.log('Hello jQuery multi');
		}
	)	
	
	$( 
		function() {
			console.log('Hello jQuery short');
		}
	)
	//여러개 사용가능
	
	jQuery(
		function() {
			console.log('Hello jQuery original');
		}
	)
	
	
	
</script>
</head>
<body>

</body>
</html>