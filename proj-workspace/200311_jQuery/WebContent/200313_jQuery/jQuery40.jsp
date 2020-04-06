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
				url : '../data/param.jsp?data=hello',//주로 get
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
			
		})
		
	})
</script>
</head>
<body>
	<button id="btn">요청</button>
</body>
</html>

