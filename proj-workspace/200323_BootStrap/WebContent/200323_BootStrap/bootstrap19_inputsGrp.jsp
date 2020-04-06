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
https://www.w3schools.com/bootstrap4/bootstrap_forms_input_group.asp
-->

<body>
  
<div class="container mt-3">
  <h1>Input Group Buttons</h1>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <button class="btn btn-outline-primary" type="button">Basic Button</button>  
    </div>
    <input type="text" class="form-control" placeholder="Some text">
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-append">
      <button class="btn btn-success" type="submit">Go</button>  
     </div>
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="Something clever..">
    <div class="input-group-append">
      <button class="btn btn-primary" type="button">OK</button>  
      <button class="btn btn-danger" type="button">Cancel</button>  
     </div>
  </div>
</div>


    
</body>
</html>

