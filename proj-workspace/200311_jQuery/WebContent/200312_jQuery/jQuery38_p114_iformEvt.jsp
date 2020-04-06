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
		$('#my-form').submit(function(event) {
			// 입력 양식의 value를 가져옵니다
			var name = $('#name').val();
			var password = $('#password').val();
			// 출력합니다.
			alert(name + ' : ' + password);
			// 기본 이벤트를 제거합니다
			event.preventDefault();
		})

		$('#all-check').change(function() {
			if (this.checked) {
				$('#check-item').children().prop('checked', true);
			} else {
				$('#check-item').children().prop('checked', false);

			}
		})
	})
</script>
</head>
<body>
	<form id="my-form">
		<table>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" id="name" /></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="password" id="password" /></td>
			</tr>
		</table>
		<input type="submit" value=" 제출" />
	</form>

	<input type="checkbox" id="all-check"/>
	<label>All </label>
	<div id="check-item">
		<input type="checkbox" /> <label>A Option</label> 
		<input type="checkbox" /> <label>B Option</label> 
		<input type="checkbox" /> <label>C Option</label>
	</div>
</body>
</html>

