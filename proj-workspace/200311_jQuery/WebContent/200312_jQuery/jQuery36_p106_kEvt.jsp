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
		$('textarea').keyup(function() {
			// 남은 글자 수를 구합니다
			var inputLength = $(this).val().length;
			var remain = 150 - inputLength;

			// 문서 객체에 입력합니다
			$('h1').html(remain);
			// 문서 객체의 색상을 변경합니다
			if (remain >= 0) {
				$('h1').css('color', 'black ');
			} else {
				$('h1').css('color', 'red ');
			}
		})
	})
</script>
</head>
<body>
	<div>
		<p>지금 내 생각을</P>
		<h1>150</h1>
		<textarea cols="78" rows="5"></textarea>
	</div>
</body>
</html>

