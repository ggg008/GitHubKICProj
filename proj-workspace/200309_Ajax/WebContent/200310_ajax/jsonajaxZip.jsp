<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	box-sizing: border-box;
}

div.li_table {
	width : 900px;
	display: table;
}


ul {

	list-style-type: none;
	width: 100%;
	display: table-row;
	flex-wrap: wrap;
}

li {
	flex: 0 0 50%;
	border: 1px solid grey;
	padding: 1em;
	display: table-cell;
	align-items: flex-end;
}

</style>

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
						console.log(json);
						//console.log(json[0]);
						
						var zip = '';
						
						for(var i = 0; i < json.length; ++i){
							
							console.log(json[i].zipcode);
							zip += '<ul>';
							zip += '<li>' + json[i].zipcode + '</li>';
							zip += '<li>' + json[i].sido + '</li>';
							zip += '<li>' + json[i].gugun + '</li>';
							zip += '<li>' + json[i].dong + '</li>';
							zip += '<li>' + json[i].ri + '</li>';
							zip += '<li>' + json[i].bunji + '</li>';
							zip += '</ul>';
							
						}
						/* 
						 */
						 
						 document.getElementById('result').innerHTML = zip;
						 
						 
					} else {
						alert('서버오류');
					}
				}
			}

			var data = document.getElementById('data').value;

			
			var url = '../data2/jsonZip.jsp?dong=' + encodeURIComponent(data);

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
	
	<div id="result" class="li_table">
		<ul>
		  <li>1.</li>
		  <li>2.</li>
		  <li>3.</li>
		  <li>4.</li>
		</ul>
	</div>
	
</body>
</html>