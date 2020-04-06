<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<link rel="stylesheet" href="../css/base/jquery-ui.css" />
<style type="text/css">
body {
	font-size: 80%
}

input[type=text] {
	padding: 5px;
	text-align: center;
	margin: 0px;
}
</style>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(
			function() {

				$('#result').accordion();
				$('#btn').button();

				$('#btn').on(
						'click',
						function() {
							var dong = $('#dong').val().trim();

							if (dong == '') {
								alert('응~ 동이름 입력안했어~');
								return;
							}
							$.ajax({
								// 다국어이면 url 인코딩
								url : '../data/zipcode_json.jsp?dong='
										+ encodeURIComponent(dong),//주로 get
								type : 'get',
								dataType : 'json',
								success : function(data) {
									// 중심적인 처리
									console.log('성공 : ' + typeof (data));
									console.log(data);
									if (data.length <= 0) {
										alert('응~ 그런 주소 없어~');
										return;
									}
									$('#result').empty();

									var output = "";
									$.each(data, function(i, element) {

										//js객체이기때문에 직접접근. jsonajax01 참고
										//var name = element.name;
										console.log(element);
										output += "<h4>" + element.zipcode
												+ "</h4>";
										output += "<div>";
										output += "<ul>";
										$.each(element, function(key, item) {
											if (key != "zipcode") {
												output += "<li>" + key + " : "
														+ item + "</li>";
											}
											console.log(key);
											//console.log(key + ': ' + item);

										})
										output += "</ul>";
										output += "</div>";
									})
									output += "</table>";

									$('#result').append(output);
									$('#result').accordion('refresh');
								},
								error : function(error) {
									// 404일때
									console.log('실패 : ' + error.status);
									console.log(error.responseText);
								}
							})

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
	<fieldset>
		<legend>우편번호 검색기</legend>
		<label for="dong">동이름 : </label> <input type="text" id="dong"
			class="text ui-widget-content ui-corner-all">
		<button id="btn">요청</button>
	</fieldset>
	<div id="result"></div>

</body>
</html>

