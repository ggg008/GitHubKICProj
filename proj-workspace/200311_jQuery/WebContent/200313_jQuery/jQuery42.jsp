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
				url : '../data/json3.jsp',//주로 get
				type: 'get',
				dataType: 'json',
				success: function(data) {
					// 중심적인 처리
					console.log('성공 : ' + typeof(data));
					console.log(data)
					
					var output = "<table width='500' border='1'>";
					$.each(data, function(i, element) {
						//js객체이기때문에 직접접근. jsonajax01 참고
						var name2 = element.name;
						/* 
						var name = $(this).find('name').text();
						var publisher = $(this).find('publisher').text();
						var author = $(element).find('author').text();
						var price = $(element).find('price').text();
						 */
						//console.log($(this));
						//console.log(typeof(element));
						//console.log(element);
						//console.log(name);
						console.log(name2);
						

						output += "<tr>";
						output += "	<td>" + name2 + "</td>";
						output += "</tr>";

						//$('#result').html($('#result').html() + $(this).name);
						//document.getElementById('result').innerHTML += text;
					})
					output += "</table>";

					$('#result').html(output);
				},
				error: function(error) {
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

