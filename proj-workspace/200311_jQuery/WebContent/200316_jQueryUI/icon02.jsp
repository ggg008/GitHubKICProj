<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath().substring(request.getContextPath().length())%></title>
<link rel="stylesheet" href="../css/vader/jquery-ui.css" />
<style type="text/css">
body {
	font-size: 80%
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	//end() 문서 객체 선택을 (필터링한 선택 내에서가 아니라) 한단계 전 선택부터
	$(function() {
		$(".widget button").eq(0).button().end().eq(1).button({
			icon : "ui-icon-gear",
			showLabel : false
		}).end().eq(2).button({
			icon : "ui-icon-gear"
		}).end().eq(3).button({
			icon : "ui-icon-gear",
			iconPosition : "end"
		}).end().eq(4).button({
			icon : "ui-icon-gear",
			iconPosition : "top"
		}).end().eq(5).button({
			icon : "ui-icon-gear",
			iconPosition : "bottom"
		});
	});
</script>
</head>
<body>
	<div class="widget">
		<h1>Widget</h1>
		<button>Button with only text</button>
		<button>Button with icon only</button>
		<button>Button with icon on the left</button>
		<button>Button with icon on the right</button>
		<button>Button with icon on the top</button>
		<button>Button with icon on the bottom</button>
	</div>
	<div class="css">
		<h1>CSS</h1>
		<button class="ui-button ui-widget ui-corner-all">Button with
			only text</button>
		<button class="ui-button ui-widget ui-corner-all ui-button-icon-only"
			title="Button with icon only">
			<span class="ui-icon ui-icon-gear"></span> Button with icon only
		</button>
		<button class="ui-button ui-widget ui-corner-all">
			<span class="ui-icon ui-icon-gear"></span> Button with icon on the
			left
		</button>
		<button class="ui-button ui-widget ui-corner-all">
			Button with icon on the right <span class="ui-icon ui-icon-gear"></span>
		</button>
		<button class="ui-button ui-widget ui-corner-all">
			<span class="ui-icon ui-icon-gear ui-widget-icon-block"></span>
			Button with icon on the top
		</button>
		<button class="ui-button ui-widget ui-corner-all">
			Button with icon on the bottom <span
				class="ui-icon ui-icon-gear ui-widget-icon-block"></span>
		</button>
	</div>
</body>
</html>

