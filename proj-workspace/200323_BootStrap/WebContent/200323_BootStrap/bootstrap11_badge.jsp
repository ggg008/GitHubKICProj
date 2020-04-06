<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath()%></title>

<link rel="stylesheet" href="../css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
	})
</script>

</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_badges.asp
-->

<body>

	
<div class="container">
  <h2>Badge inside a Button</h2>
  <button type="button" class="btn btn-primary">
    Messages <span class="badge badge-light">4</span>
  </button>
  <button type="button" class="btn btn-danger">
    Notifications <span class="badge badge-light">7</span>
  </button>
</div>	

</body>
</html>

