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
		document.getElementById('btn').onclick = function() {
			//alert('click');
			
			
			//javascript			
			var ops = document.getElementById('sel');
			var text = ops.selectedIndex +': ' + ops[ops.selectedIndex].innerHTML;
			
			//jQuery
			//var text = $('select > option:selected').text();
			
			alert(text);
		}
	})	
</script>
</head>
<body>
	<form name="frm">
		<select id="sel">
			<option value="1">사과</option>
			<option value="2">수박</option>
			<option value="3">딸기</option>
			<option value="4">참외</option>
		</select>
		<br><br>
		<input type="button" id="btn" value="선택"/>
	</form>
	
</body>
</html>