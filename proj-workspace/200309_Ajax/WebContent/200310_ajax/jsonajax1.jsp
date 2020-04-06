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

						var data = request.responseText.trim();
						console.log(data);

						//구
						//var json = eval('(' + data + ')' );
						
						//신
						var json = JSON.parse(data);
						//console.log(json);
						
						//console.log(json[0]);
						
						for(var i = 0; i < json.length; ++i){
							console.log(json[i]);
							/* 
							console.log(json[i].name);
							console.log(json[i].publisher);
							console.log(json[i].author);
							console.log(json[i].price);
							 */
						}
						
						
					} else {
						alert('서버오류');
					}
				}
			}
			

			var data = document.getElementById('data').value;
			
			var url = '../data2/json3.jsp';
			var url2 = 'http://192.168.0.20:8080/AjaxEx01/data/json3.jsp';

			request.open('GET', url2, true);
			request.send();
			
		}
	}
</script>
</head>
<body>
	
	<input type="text" id="data" />
	<button id="btn" >req</button>
	<br>
	<hr>
	<div id="result"></div>

</body>
</html>