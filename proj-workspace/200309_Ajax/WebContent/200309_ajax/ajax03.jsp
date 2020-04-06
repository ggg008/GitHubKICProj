<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		this.document.getElementById('btn1').onclick = function() {
			var request = new XMLHttpRequest();
			//익스(허용) : 크롬(비허용)
			//크로스도메인 : 데이터와 html(뷰)은 같은 ip에서 요청되어야함 ← ajax의 보안
			console.log('1');
			request.open('GET', '../data2/csv2.jsp', false);
			console.log('2');
			request.send();
			console.log('3');
			console.log(request.responseText);
		}

		this.document.getElementById('btn2').onclick = function() {
			var request = new XMLHttpRequest();
			/* 
			console.log('1');
			request.onreadystatechange = function() {
				//console.log('readystate : ' + request.readyState);	
				switch (request.readyState) {
				case 1:
					console.log('readystate 1 : ' + request.responseText);
					break;
				case 2:
					console.log('readystate 2 : ' + request.responseText);
					break;
				case 3:
					console.log('readystate 3 : ' + request.responseText);
					break;
				case 4:
					console.log('readystate 4 : ' + request.responseText);
					break;
				default:
					console.log('readystate : ' + request.responseText);
					break;
				}
			}
			 */
			
			if(request.readyState == 4) {
				console.log(request.status);
				console.log('4 : ' + request.responseText);
			}

			request.open('GET', '../data2/csv5.jsp', true);
			console.log('2');
			request.send();
			console.log('3');
			console.log(request.responseText);
		}
	}
</script>
</head>
<body>

	<button id="btn1">동기식</button>
	<button id="btn2">비동기식</button>
	<br>
	<hr>
	<br>
	<div id="result"></div>

</body>
</html>