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
		$('[data-toggle="popover"]').popover(); 
	})	
</script>
</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_popover.asp
-->

<body>

<div class="container">
  <h3>Popover Example</h3>
  <p>By default, the popover will appear on the right side of the element.</p>
  <p>Use the data-placement attribute to set the position of the popover on top, bottom, left or the right side of the element.</p>
  <p>Note: The placement attributes do not work if it is not enough room for them. For example, try to remove these paragraphs and click on the "Top" popover to understand how it works.</p>
  <a href="#" title="Header" data-toggle="popover" data-placement="top" data-content="Content">Top</a>
  <a href="#" title="Header" data-toggle="popover" data-placement="bottom" data-content="Content">Bottom</a>
  <a href="#" title="Header" data-toggle="popover" data-placement="left" data-content="Content">Left</a>
  <a href="#" title="Header" data-toggle="popover" data-placement="right" data-content="Content">Right</a>
</div>


</body>
</html>

