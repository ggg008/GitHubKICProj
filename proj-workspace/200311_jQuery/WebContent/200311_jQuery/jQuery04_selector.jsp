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
		//자손 (>) 
		//후손 ( )
		
		//$('ul > *').css('color', 'red');
		$('ul *').css('color', 'red');
		
		
	})	
</script>
</head>
<body>

<div>
	<ul>
		<li>사과</li>
		<li>수박</li>
		<li>딸기</li>	
	</ul>
	<ul>
		<li>사과</li>
		<li>수박</li>
		<li>딸기</li>	
	</ul>
</div>

</body>
</html>