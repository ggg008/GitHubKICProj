<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main	
	
	$(document).ready(function() {
		var object = {
			name : 'hongs'
		}
		
		console.log(object);
		
		object.region1 = 'seoul';
		object.part1 = '리터';
		
		console.log(object);
		
		$.extend(object,
			{region2: '강남', part2: '베이스'}				
		);
		
		console.log(object);
		
	})
</script>
</head>
<body>

</body>
</html>
