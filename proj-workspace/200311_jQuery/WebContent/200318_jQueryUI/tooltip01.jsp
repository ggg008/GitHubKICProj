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
	$(document).ready(function() {
		$(document).tooltip();
		//title이 툴팁화
	})
</script>
</head>
<body>

	<p><a href="#" title="That&apos;s what this widget is">Tooltips</a> can be attached to any element. When you hover
	the element with your mouse, the title attribute is displayed in a little box next to the element, just like a native tooltip.</p>
	<p>But as it's not a native tooltip, it can be styled. Any themes built with
	<a href="http://jqueryui.com/themeroller/" title="ThemeRoller: jQuery UI&apos;s theme builder application">ThemeRoller</a>
	will also style tooltips accordingly.</p>
	<p>Tooltips are also useful for form elements, to show some additional information in the context of each field.</p>
	<p><label for="age">Your age:</label><input id="age" title="We ask for your age only for statistical purposes."></p>
	<p>Hover the field to see the tooltip.</p>

</body>
</html>

