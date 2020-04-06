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
		// 변수를 선언함니다-
		var h1 = '<h1>Header1</h1>';
		var h2 = '<h2>Header2</h2>';
		// 문서 객체를 추가합니다.
		//$('body').append(h1, h2, h1, h2);
		//$('div').prepend(h1, h2, h1, h2);
		$('hr').after(h1, h2, h1, h2);

		// 변수를 선언합니다
		var content = [ {
			name : '윤인성',
			region : '서울특별시 강서구'
		}, {
			name : '윤하린',
			region : '서울특별시 광진구'
		}, {
			name : '윤인아',
			region : '미국 메사추세츠'
		} ];

		// 문서 객체를 추가합니다
		$('div').append(function(index) {
			// 변수를 선언합니다
			var item = content[index];
			var output = '';
			output += '<h1>' + item.name + '</h1>';
			output += '<h2>' + item.region + '</h2>';
			return output;
		})
		
		document.getElementById('btn1').onclick = function() {
			$('div').remove();
		}
		
		document.getElementById('btn2').onclick = function() {
			$('div').empty();
		}

	})
</script>
</head>
<body>
	<button id="btn1">제거</button>
	<button id="btn2">제거2</button>
	<br><hr>
	
	<div></div>
	<div></div>
	<div></div>
	
</body>
</html>

