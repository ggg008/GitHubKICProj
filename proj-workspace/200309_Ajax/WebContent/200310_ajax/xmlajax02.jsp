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

						var data = request.responseXML;
						var names = data.getElementsByTagName('name');
						var publishers = data.getElementsByTagName('publisher');
						
						//console.log(names);
						//console.log(names.length);
						//console.log(names[0].childNodes[0].nodeValue);
						
						for(var i = 0; i < names.length; ++i){
							console.log(names[i].childNodes[0].nodeValue);
							console.log(publishers[i].childNodes[0].nodeValue);
						}
						
						console.log('---------------');
						
						
						//최신 경향(array로 캐스팅하여 사용)
						//Array.from(names).forEach(function(elt, i, array) {
						//둘다됨
						[].slice.call(names).forEach(function(elt, i, array) {							
							console.log('loop' + ' ' + elt.childNodes[0].nodeValue + ' ' + i + ' ' + array);
						})
						
						
						
						//document.getElementById('result').innerHTML = result;
						
						
						

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