<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>jq18</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 
		$(document).find('h1').each(function(i, element) {
			console.log(element);		
		})
		 */
		
		/*
		$('body').find('h1').each(function(i, element) {
			console.log(element);		
		})
		*/
		 
		$('body').find('.select').each(function(i, element) {
			console.log(this);		
		})
	});
</script>
</head>
<body>
	<h1 class="select">Header-0</h1>
	<h1>Header-1</h1>
	<h1 class="select">Header-2</h1>
	<h1>Header-3</h1>
	<h1 class="select">Header-4</h1>
	<h1>Header-5</h1>
	<h1 class="select">Header-2</h1>
	
	<table>
		<tr>
			<th>이름</th>
			<th>혈액형</th>
			<th>지 역</th>
		</tr>
		<tr>
			<td>강민수</td>
			<td>AB형</td>
			<td>서울특별시 송파구</td>
		</tr>
		<tr>
			<td>구지연</td>
			<td>B형</td>
			<td>미국 캘리포니아</td>
		</tr>
		<tr>
			<td>김미화</td>
			<td>AB형</td>
			<td>미국 메사추세츠</td>
		</tr>
		<tr>
			<td>김선화</td>
			<td>O형</td>
			<td>서울 강서구</td>
		</tr>
		<tr>
			<td>남기주</td>
			<td>A형</td>
			<td>서울 노량진구</td>
		</tr>
		<tr>
			<td>윤하린</td>
			<td>B형</td>
			<td>서울 용산구</td>
		</tr>
	</table>
</body>
</html>
