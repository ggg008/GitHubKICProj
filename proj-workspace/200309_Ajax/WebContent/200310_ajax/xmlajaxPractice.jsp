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

						var data = request.responseXML;		
						//console.log(data);
						
						var items = data.getElementsByTagName('item');
						console.log(items);
						console.log(items[0].childNodes[1]);
						
						
						
						var result = "<table width='600' border='1'>";
						for(var i = 0; i < items.length; ++i){							
							//console.log(items[i].getElementsByTagName('title'));
							//console.log(items[i].getElementsByTagName('title')[0].childNodes[0].nodeValue);
							console.log('title : ' + items[i].childNodes[1].childNodes[0].nodeValue);
							console.log('description : ' + items[i].childNodes[5].childNodes[0].nodeValue);
							
							
							
							
							//console.log(items[i].getElementsByTagName('description').childNodes[0].nodeValue);
						}
						result += "</table>";
					} else {
						alert('서버오류');
					}
				}
			}
			

			var data = document.getElementById('data').value;
			
			var url = '../data2/proxyNaverRSS.jsp?data=' + encodeURIComponent(data);
			
			//open api
			var url2 = 'http://newssearch.naver.com/search.naver?where=rss&query=starwars';

			request.open('GET', url, true);
			request.send();
			
		}
	}
</script>
</head>
<body>
	
	<input type="text" id="data" />
	<button id="btn">req</button>
	<br>
	<hr>
	<div id="result"></div>

</body>
</html>