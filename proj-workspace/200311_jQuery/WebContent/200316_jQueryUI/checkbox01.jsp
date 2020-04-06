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
;
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('input[type="checkbox"]').checkboxradio({
			icon: false//체크박스->토글
			
		});
		//이름값은 라벨에서 찾음
		
		$('input[type="radio"]').checkboxradio({
			
		});
		
	})
</script>
</head>
<body>
	<fieldset>
		<legend>좋아하는 과일</legend>
		<!-- 라벨 없고 인풋만 있을시 에러남! -->
		<label>사과 <input type="checkbox" name="cb1" />
		</label> <label>수박 <input type="checkbox" name="cb2" />
		</label> <label>딸기 <input type="checkbox" name="cb3" />
		</label>
	</fieldset>
	
	<fieldset>
		<legend>좋아하는 과일2</legend>
		<!-- 이름이 같아야 함 -->
		<label>사과 <input type="radio" name="cb" />
		</label> <label>수박 <input type="radio" name="cb" />
		</label> <label>딸기 <input type="radio" name="cb" />
		</label>
	</fieldset>
</body>
</html>

