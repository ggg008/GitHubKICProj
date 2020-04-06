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

						var data = request.responseText;
						
						var list = data.split('<li class="ca_item">');
						
						//console.log(list);
												
						for(var i = 1; i < list.length; ++i){
							var headline = list[i].split('>')[1].split('<')[0];
							console.log(i + ': ' + headline);						
						}
						
						
					} else {
						alert('서버오류');
					}
				}
			}
			
			//프록시를 이용한 크로스도메인 회피
			var url = '../data2/proxyNaverNews.jsp';

			request.open('GET', url, true);
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