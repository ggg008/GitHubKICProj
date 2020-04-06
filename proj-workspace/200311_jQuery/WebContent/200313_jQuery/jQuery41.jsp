<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#btn').on('click', function() {
			//alert('click');
			$.ajax({
				// 다국어이면 url 인코딩
				url : '../data/xml2.jsp',//주로 get
				type : 'get',
				dataType : 'xml',
				success : function(data) {
					// 중심적인 처리
					console.log('성공');
					console.log(data);

					/* 
					var names = data.getElementsByTagName('name');					
					for(var i = 0; i < names.length; ++i){
						console.log(names[i].childNodes[0].nodeValue);
						document.getElementById('result').innerHTML += names[i].childNodes[0].nodeValue + '<br>';
					}
					 */


					
					var output = "<table width='500' border='1'>";
					$(data).find('book').each(function(i, element) {
						//xml문서이기 때문에 검색. xmlajax01 참고
						var name = $(this).find('name').text();
						var publisher = $(this).find('publisher').text();
						var author = $(element).find('author').text();
						var price = $(element).find('price').text();

						//console.log($(this));
						console.log(typeof(element));
						console.log($(element));
						

						output += "<tr>";
						output += "	<td>" + name + "</td>";
						output += "	<td>" + publisher + "</td>";
						output += "	<td>" + author + "</td>";
						output += "	<td>" + price + "</td>";
						output += "</tr>";

						//$('#result').html($('#result').html() + $(this).name);
						//document.getElementById('result').innerHTML += text;
					})
					output += "</table>";

					$('#result').html(output);
				},
				error : function(error) {
					// 404일때
					console.log('실패 : ' + error.status);
					console.log(error.responseText);
				}
			})

		})

	})
</script>
</head>
<body>
	<button id="btn">요청</button>
	<br>
	<hr>
	<div id="result"></div>
</body>
</html>

