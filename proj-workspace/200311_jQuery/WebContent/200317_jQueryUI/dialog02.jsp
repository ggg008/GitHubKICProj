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

label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td, div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		
		$('#dialog-form').dialog({
			autoOpen: false,
			modal: true,
			width: 350,
			height: 350,	
			buttons: {
				'cancel': function() {
					$(this).dialog('close');
				},
				'ok': function() {
					$(this).dialog('close');
					addUser();
				}		
			},
			
		})
		
		$('#create-user').button().on('click', function() {
			$('#dialog-form').dialog('open');
		})
		
		var emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
		var name = $( "#name" );
		var email = $( "#email" );
		var password = $( "#password" );

		
	    function addUser() {
	        var valid = true;
	        //allFields.removeClass( "ui-state-error" );
	        
	   /*      
	        valid = valid && checkLength( name, "username", 3, 16 );
	        valid = valid && checkLength( email, "email", 6, 80 );
	        valid = valid && checkLength( password, "password", 5, 16 );
	   
	        valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
	        valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
	        valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
	         */
	        
	        if ( valid ) {
	        	
				var html = "<tr>";
				html += "<td>" + name.val() + "</td>";
				html += "<td>" + email.val() + "</td>";
				html += "<td>" + password.val() + "</td>";
				html += "<td><button>수정</button></td>";
				html += "<td><button>삭제</button></td>";
				html += "</tr>";
				 	
				$( "#users tbody" ).append(html);//아이디 users 태그에 후손중 tbody 타입 태그를 전부 셀렉터
	        }
	        return valid;
	      }
	});
	
	
	
</script>
</head>
<body>
	<button id="create-user">사용자 생성</button>
	<br><hr>
	<div id="dialog-form" title="Create new user">
	  <p class="validateTips">All form fields are required.</p>
	 
	  <form>
	    <fieldset>
	      <label for="name">Name</label>
	      <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
	      <label for="email">Email</label>
	      <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
	      <label for="password">Password</label>
	      <input type="password" name="password" id="password" value="1234" class="text ui-widget-content ui-corner-all">
	 
	      <!-- Allow form submission with keyboard without duplicating the dialog button -->
	      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
	    </fieldset>
	  </form>
	</div>
	<div id="users-contain" class="ui-widget">
	  <h1>Existing Users:</h1>
	  <table id="users" class="ui-widget ui-widget-content">
	    <thead>
	      <tr class="ui-widget-header ">
	        <th>Name</th>
	        <th>Email</th>
	        <th>Password</th>
	        
	        <th colspan="2"></th>
	      </tr>
	    </thead>
	    <tbody>
	    </tbody>
	  </table>
	</div>
</body>
</html>

