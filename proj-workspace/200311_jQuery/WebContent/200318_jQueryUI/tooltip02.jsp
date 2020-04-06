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
label {
	display: inline-block; width: 5em;
}
fieldset div {
	margin-bottom: 2em;
}
fieldset .help {
	display: inline-block;
}
.ui-tooltip {
	width: 210px;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		var tooltip = $("[title]").tooltip({
			position: {
				my: "left top",
				at: "right+5 top-5",
				collision: "none"
			}
			
		})
		$("<button>").text("Show help").button().on("click", function() {
			tooltip.tooltip("open");
		}).insertAfter("form");
		
	})
</script>
</head>
<body>

	<form>
	  <fieldset>
	    <div>
	      <label for="firstname">Firstname</label>
	      <input id="firstname" name="firstname" title="Please provide your firstname.">
	    </div>
	    <div>
	      <label for="lastname">Lastname</label>
	      <input id="lastname" name="lastname" title="Please provide also your lastname.">
	    </div>
	    <div>
	      <label for="address">Address</label>
	      <input id="address" name="address" title="Your home or work address.">
	    </div>
	  </fieldset>
	</form>
 

</body>
</html>

