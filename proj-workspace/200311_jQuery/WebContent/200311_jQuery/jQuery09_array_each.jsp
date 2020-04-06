<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>jQuery9</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		var array = [ {
			name : 'daum',
			link : 'https://www.daum.net'
		}, {
			name : 'naver',
			link : 'https://www.naver.com'
		}, {
			name : 'google',
			link : 'https://www.google.com'
		}, ]

		//기존
		/* 
		for(var i = 0; i <array.length; ++i){
			console.log(array[i].name + ': ' + array[i].link);
		}
		
		for(var i in array) {
			console.log(array[i].name + ': ' + array[i].link);
		}
		
		array.forEach(function(elt) {
			console.log(elt.name + ': ' + elt.link);
		})
		 */

		//jQuery
		$.each(array, function(i, elt) {
			console.log(i + ': ' + elt.name + ' - ' + elt.link);

		})

		var object = {
			name : '홍길동',
			region : '서울시 강남구',
			part : '베이스'
		};

		console.log(object.name);
		console.log(object.part);

		$.each(object, function(key, item) {
			console.log(key + ': ' + item);

		})

		/* 
		$('h2').each(function(i, element) {
			console.log( typeof element);
			console.log( element.innerHTML);
		})
		 */

		$('h2').each(function() {
			console.log(this.innerHTML);
		})

	})
</script>
</head>
<body>

	<h2>item - 0</h2>
	<h2>item - 1</h2>
	<h2>item - 2</h2>
	<h2>item - 3</h2>
	<h2>item - 4</h2>

</body>
</html>