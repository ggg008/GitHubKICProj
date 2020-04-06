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
	
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	//ready 내부에 선언 해두는게 명시적으로 좋다
	
</script>

</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_forms_custom.asp
-->

<body>
  

<div class="container mt-3">
  <h2>Custom Range</h2>
  <p>To create a custom range menu, add the .custom-range class to the input element with type="range":</p>
  <form action="/action_page.php">
    <label for="customRange">Custom range</label>
    <input type="range" class="custom-range" id="customRange" name="points1">
    <label for="defaultRange">Default range</label>
    <input type="range" id="defaultRange" name="points2">
    <p><button type="submit" class="btn btn-primary">Submit</button></p>
  </form>
</div>
<hr>
<div class="container mt-3">
  <h2>Custom File</h2>
  <p>To create a custom file upload, wrap a container element with a class of .custom-file around the input with type="file". Then add the .custom-file-input to the file input:</p>
  <form action="/action_page.php">
    <p>Custom file:</p>
    <div class="custom-file mb-3">
      <input type="file" class="custom-file-input" id="customFile" name="filename">
      <label class="custom-file-label" for="customFile">Choose file</label>
    </div>
    
    <p>Default file:</p>
    <input type="file" id="myFile" name="filename2">
  
    <div class="mt-3">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form>
</div>



    
</body>
</html>

