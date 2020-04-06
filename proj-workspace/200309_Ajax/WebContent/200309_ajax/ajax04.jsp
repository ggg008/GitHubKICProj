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
						
						document.getElementById('result').innerHTML = displayHTML(request.responseText.trim());
						
					} else {
						alert('서버오류');
					}
				}				
			}

			request.open('GET', '../data2/csv2.jsp', true);
			request.send();
		}
	}
	
	var displayHTML = function(data) {
		var arrData = data.split('\n');
		var result = "<table width='600' border='1'>";
		for (var i = 0; i < arrData.length; ++i) {
			var rowData = arrData[i].split(',');

			result += "<tr>";
			result += "<td>" + rowData[0] + "</td>";
			result += "<td>" + rowData[1] + "</td>";
			result += "<td>" + rowData[2] + "</td>";
			result += "<td>" + rowData[3] + "</td>";
			result += "</tr>";
		}
		result += "</table>";
		
		return result;
		
		//document.getElementById('result').innerHTML = result;	
		
	}
</script>
</head>
<body>

	<button id="btn">요청</button>
	<br>
	<hr>
	<br>
	<div id="result"></div>

</body>
</html>