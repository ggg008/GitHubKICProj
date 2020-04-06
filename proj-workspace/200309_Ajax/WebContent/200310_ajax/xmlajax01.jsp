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
						
						console.log(request.responseText);
						console.log(request.responseXML);

						var list = request.responseXML.getElementsByTagName('book');
						//var list = document.getElementsByTagName("book");
						//console.log(list);

						var result = "<table width='600' border='1'>";
						for(var i = 0; i < list.length; ++i){

							/* 
							console.log(list[i].childNodes[0].childNodes[0]);
							console.log(list[i].childNodes[1].childNodes[0]);
							console.log(list[i].childNodes[2].childNodes[0]);
							console.log(list[i].childNodes[3].childNodes[0]);
							console.log('-----');
							 */							
							
							var psName = list[i].getElementsByTagName("name");	
							var psPublisher = list[i].getElementsByTagName("publisher");
							var psAuthor = list[i].getElementsByTagName("author");
							var psPrice = list[i].getElementsByTagName("price");
							//console.log(psName[0].childNodes[0].nodeValue);
							
							result += "<tr>";
							result += "<td>" + psName[0].childNodes[0].nodeValue + "</td>";
							result += "<td>" + psPublisher[0].childNodes[0].nodeValue + "</td>";
							result += "<td>" + psAuthor[0].childNodes[0].nodeValue + "</td>";
							result += "<td>" + psPrice[0].childNodes[0].nodeValue + "</td>";
							result += "</tr>";
						}
						result += "</table>";

						//console.log(result);
						document.getElementById('result').innerHTML = result;
						
						
						

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