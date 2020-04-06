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
			var dong = $('#dong').val().trim();
			if (dong == '') {
				alert('응~ 동이름 입력안했어~');
			} else {
				$.ajax({
					// 다국어이면 url 인코딩
					url : '../data/zipcode_json.jsp?dong=' + encodeURIComponent(dong) ,//주로 get
					type: 'get',
					dataType: 'json',
					success: function(data) {
						// 중심적인 처리
						console.log('성공 : ' + typeof(data));
						console.log(data)
						
						var output = "<table width='700' border='1'>";
						$.each(data, function(i, element) {
							//js객체이기때문에 직접접근. jsonajax01 참고
							//var name = element.name;
							console.log(element);

							output += "<tr>";
							$.each(element, function(key, item) {
								output += "	<td>" + item + "</td>";
								//console.log(key + ': ' + item);

							})
							output += "</tr>";
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
			}

			/* 
			$.ajax({
				// 다국어이면 url 인코딩
				url : '../data/zipcode_json',//주로 get
				type: 'get',
				dataType: 'text',
				success: function(data) {
					// 중심적인 처리
					console.log('성공 : ' + data);
				},
				error: function(error) {
					// 404일때
					console.log('실패 : ' + error.status);
					console.log(error.responseText);
				}
			})
			 */
		})

	})
</script>
</head>
<body>
	<input type="text" id="dong" size="25" />
	<button id="btn">요청</button>
	<br>
	<hr>
	<div id="result"></div>

</body>
</html>

