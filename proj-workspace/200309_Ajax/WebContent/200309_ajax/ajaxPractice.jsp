<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload = function() {

		this.document.getElementById('btn').onclick = function() {
			var request = new XMLHttpRequest();

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {

						console.log(request.responseText.trim());
						
						document.getElementById('result').innerHTML += request.responseText.trim() + '<br>';

					} else {
						alert('서버오류');
					}
				}
			}
			
			var data = document.getElementById('data').value;
			console.log(data);
			
			var url = './paramPractice.jsp?data=' + encodeURI(data);
			document.getElementById('result').innerHTML += data + '<br>';

			request.open('GET', url, true);
			request.send();
			
			
		}
		
		
		this.document.getElementById('btn2').onclick = function() {
			document.getElementById('result').innerHTML = '';
		}
		
	}
</script>
</head>
<body>

	<input type="text" id="data" />
	<button id="btn">req</button>
	<button id="btn2">clear</button>
	<br>
	<hr>
	<div id="result"></div>

</body>
</html>