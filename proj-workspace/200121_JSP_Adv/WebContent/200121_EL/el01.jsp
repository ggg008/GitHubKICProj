<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>출력</td>
			<td width="100"><%= 2 + 3 %></td>
		</tr>

		<tr>
			<td>출력</td>
			<td width="100">${ "3" }</td>
		</tr>		
		
		<tr>
			<td>출력</td>
			<td width="100">${ 2 + 3 }</td>
		</tr>
		<%-- 
		<tr>
			<td>출력</td>
			<td width="100">${ 2 div 3 }</td>
		</tr>
		 --%>
		<tr>
			<td>출력</td>
			<td width="100">${ 2 mod 3 }</td>
		</tr>

		<tr>
			<td>출력</td>
			<td width="100">${ "2" + 3 }</td>
		</tr>
		
		<tr>
			<td>출력</td>
			<td width="100">${ "2" + "3" }</td> <!-- +에 문자열을 잇는 기능은 없음 -->
		</tr>

		<tr>
			<td>출력</td>
			<td width="100">${ 2 < 3 }</td>
		</tr>

		<tr>
			<td>출력</td>
			<td width="100">${ 2 lt 3 }</td>
		</tr>

		<tr>
			<td>출력</td>
			<td width="100">${ empty data }</td>
		</tr>
	</table>
</body>
</html>