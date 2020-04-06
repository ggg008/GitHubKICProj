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
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/i18n/datepicker-ko.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#datepicker1').datepicker({
			dateFormat : 'yy-mm-dd',
			showAnim: "slide",
			numberOfMonths : 3
		})
		
		$("#format").on('change', function() {
			var test = $( '#datepicker1' ).datepicker( "option", "dateFormat");
			console.log( test );
			$( '#datepicker1' ).datepicker( "option", "dateFormat", $( this ).val() );
		})
		//$( '#datepicker1' ).datepicker( "option", $.datepicker.redional['ko'] );
		
		


	})
</script>
</head>
<body>
	Date :
	<input type="text" id="datepicker1" />

	<p>
		Format options:<br> <select id="format">
			<option value="mm/dd/yy">Default - mm/dd/yy</option>
			<option value="yy-mm-dd">ISO 8601 - yy-mm-dd</option>
			<option value="d M, y">Short - d M, y</option>
			<option value="d MM, y">Medium - d MM, y</option>
			<option value="DD, d MM, yy">Full - DD, d MM, yy</option>
			<option
				value="&apos;day&apos; d &apos;of&apos; MM &apos;in the year&apos; yy">With
				text - 'day' d 'of' MM 'in the year' yy</option>
		</select>
	</p>


</body>
</html>

