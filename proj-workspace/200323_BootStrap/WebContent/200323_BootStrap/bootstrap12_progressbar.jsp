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
		
		
		var maxvalue = $(".progress").css("width");
		console.log( maxvalue );
		var unit = parseFloat(maxvalue) / 10;
		console.log( unit );
		
		
		
		$("#minusbtn").on("click", function() {
			/* 
			var value = $("#prgbar").css("width");
			value = parseFloat(value);			
			console.log( value );
			 */
			var test = $("#prgbar").attr("style");
			var percent = parseInt( test.split(":")[1] );
			console.log( percent );
			
			$("#prgbar").css("width", (percent - 10) + "%" );
		})
		
		$("#plusbtn").on("click", function() {
			/* 
			var value = $("#prgbar").css("width");
			value = parseFloat(value);
			console.log( value );
			
			$("#prgbar").css("width", value + unit );
			 */
			
			var test = $("#prgbar").attr("style");
			var percent = parseInt( test.split(":")[1] );
			console.log( percent );
						
			$("#prgbar").css("width", (percent + 10) + "%" );
			
		})
		
		$("#con").on("click", function() {
			/* 
			var maxvalue = $("#prgbar").css("max");

			console.log(maxvalue);
 */
			
			var test = $("#prgbar").attr("style");
			var percent = parseInt( test.split(":")[1] );
			
			console.log( array );
			
		})
		
	})
</script>

</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_progressbars.asp
-->

<body>

	
<div class="container">
  <h2>Animated Progress Bar</h2>
  <p>Add the .progress-bar-animated class to animate the progress bar:</p> 
  <div class="progress">
    <div id="prgbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width:40%"></div>
  </div>
  <br><br>
  <button id="minusbtn" type="button" class="btn btn-primary">-</button>
  <button id="plusbtn" type="button" class="btn btn-primary">+</button>
  <button id="con" type="button" class="btn btn-primary">Basic</button>
</div>

</body>
</html>

