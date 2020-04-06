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
						//console.log(data);

						//구
						//var json = eval('(' + data + ')' );
						
						//신
						var json = JSON.parse(data);
						//console.log(json.data);
						//console.log(json[0]);
						
						for(var i = 0; i < json.data.length; ++i){
							
							console.log(json.data[i].rank + ': ' + json.data[i].keyword);
						}
						
					} else {
						alert('서버오류');
					}
				}
			}
			

			
			var url = '../data2/json3.jsp';
			var url2 = 'https://www.naver.com/srchrank';

			request.open('GET', url2, true);
			request.send();
			
		}
	}
</script>
</head>
<body>
	
	<button id="btn">req</button>
	<br>
	<hr>
	<div id="result"></div>

</body>
</html>