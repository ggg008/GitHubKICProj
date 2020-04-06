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
						
						var books = data.getElementsByTagName('book');
						
						console.log(books[0].childNodes.length);
						
						for(var i = 0; i < books.length; ++i){							
							for(var j = 0; j < books[i].childNodes.length; ++j){
								console.log(books[i].childNodes[j].childNodes[0].nodeValue);								
							}
						}
						
					} else {
						alert('서버오류');
					}
				}
			}
			
			
			var url = '../data2/xml2.jsp';

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