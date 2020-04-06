<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= request.getServletPath() %></title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> <!-- 라이브러리 순서 다를시 에러 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		//내용
		console.log($('#myInput'));
		
		
		$('#myInput').on('keyup', function() {
			//console.log($(this).val());
			var value = $(this).val().toLowerCase();
			$('#myTable tr').filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				//toggle 태그 보이기 / 보이지않기
			})
		})
		
		$('#myInput2').on('keyup', function() {
			//console.log($(this).val());
			var value = $(this).val().toLowerCase();
			console.log("---------------");
			
			$('#myList li').filter(function() {
				
				var isExist = $(this).text().toLowerCase().indexOf(value) != -1;
				console.log($(this).text() + " : " + isExist);
				//쓴 알파벳의 인덱스 찾기 : 한글자도 없을시에는 -1
				$(this).toggle(isExist);
				//존재할경우 태그 보이기 / 보이지않기
				
			})
		})
	})	
</script>
</head>

<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_filters.asp
-->

<body>

	<div class="container mt-3">
		<h2>Filterable Table</h2>
		<p>Type something in the input field to search the table for first
			names, last names or emails:</p>
		<input class="form-control" id="myInput" type="text"
			placeholder="Search.."> <br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@mail.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@greatstuff.com</td>
				</tr>
				<tr>
					<td>Anja</td>
					<td>Ravendale</td>
					<td>a_r@test.com</td>
				</tr>
			</tbody>
		</table>

		<p>Note that we start the search in tbody, to prevent filtering
			the table headers.</p>
	</div>
	<hr>
	<div class="container mt-3">
		<h2>Filterable List</h2>
		<p>Type something in the input field to search the list for
			specific items:</p>
		<input class="form-control" id="myInput2" type="text"
			placeholder="Search.."> <br>
		<ul class="list-group" id="myList">
			<li class="list-group-item">First item</li>
			<li class="list-group-item">Second item</li>
			<li class="list-group-item">Third item</li>
			<li class="list-group-item">Fourth</li>
		</ul>
	</div>

</body>
</html>

