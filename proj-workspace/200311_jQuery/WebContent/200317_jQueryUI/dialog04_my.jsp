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
			show: {
				effect: 'blind',
				duration: 500,
			},
			hide: {
				effect: 'explode',
				duration: 1000
			},	
			buttons: {
				'cancel': function() {
					$(this).dialog('close');
				},
				'ok': function() {
					writeServer($('#name').val(), $('#email').val(), $('#password').val());
				}		
			},
			
		})
		
		$('#dialog-form2').dialog({
			autoOpen: false,
			modal: true,
			width: 350,
			height: 350,
			show: {
				effect: 'blind',
				duration: 500,
			},
			hide: {
				effect: 'explode',
				duration: 1000
			},	
			buttons: {
				'cancel': function() {
					$(this).dialog('close');
				},
				'modify': function() {
					modServer($('#seq').val(), $('#nameMod').val(), $('#emailMod').val(), $('#passwordMod').val());
				}		
			},
			
		})
		
		readServer();
		
		$('#create-user').button().on('click', function() {
			$('#dialog-form').dialog('open');
		})
		

	});
	
	var readServer = function() {		
		
		$.ajax({
			// 다국어이면 url 인코딩
			url : '../data/user_list.jsp',					
			type : 'get',
			dataType : 'json',
			success : function(data) {				
				$( "#users tbody" ).empty();
				
				$.each(data, function(i, element) {
					var html = "";

					//js객체이기때문에 직접접근. jsonajax01 참고
					//console.log(element);
					
					html += "<tr>";
					html += "<td>" + element.name + "</td>";
					html += "<td>" + element.email + "</td>";
					html += "<td>" + element.password + "</td>";
					html += "<td><button id='mod" + i + "'>수정</button></td>";
					html += "<td><button id='del" + i + "'>삭제</button></td>";
					html += "</tr>";
					
					$("#users tbody" ).append(html);
					
					$('#mod' + i ).button().on('click', function(e) {
						$('#seq').val(element.seq);
						//console.log(element.seq + " ## " + $('#seq').val());
						console.log(element);
						
						$('#nameMod').val(element.name);
						$('#emailMod').val(element.email);
						$('#passwordMod').val(element.password);
						
						
						$('#dialog-form2').dialog('open');						
					})
					
					$('#del' + i ).button().on('click', function(e) {
						delServer(element.seq);
					})
				})
				
				
			},
			error : function(error) {
				// 404일때
				console.log('실패 : ' + error.status);
				console.log(error.responseText);
			}
		})
	}
	
	var writeServer = function(name, email, password) {
		$.ajax({
			// 다국어이면 url 인코딩
			url : '../data/user_write.jsp',
			data: {
				name : name,
				email : email,
				password : password,
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;
				if(json.flag == 0){
					$('#dialog-form').dialog('close');
					readServer();					
				} else {
					alert('error');					
				}
			},
			error : function(error) {
				// 404일때
				console.log('실패 : ' + error.status);
				console.log(error.responseText);
				return 1;
			}
		})
	}
	
	var delServer = function(seq) {
		$.ajax({
			// 다국어이면 url 인코딩
			url : '../data/user_delete.jsp',
			data: {
				seq : seq
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;
				if(json.flag == 0){
					readServer();					
				} else {
					alert('error');					
				}
			},
			error : function(error) {
				// 404일때
				console.log('실패 : ' + error.status);
				console.log(error.responseText);
				return 1;
			}
		})
	}

	
	var modServer = function(seq, name, email, password) {
		$.ajax({
			// 다국어이면 url 인코딩
			url : '../data/user_modify.jsp',
			data: {
				seq : seq,
				name : name,
				email : email,
				password : password,
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;
				if(json.flag == 0){
					$('#dialog-form2').dialog('close');
					readServer();					
				} else {
					alert('error');					
				}
			},
			error : function(error) {
				// 404일때
				console.log('실패 : ' + error.status);
				console.log(error.responseText);
				return 1;
			}
		})
	}
	
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
	
	<div id="dialog-form2" title="Modified user">
	<input type="hidden" id="seq" value="">
	  <p class="validateTips">All form fields are required.</p>
	 
	  <form>
	    <fieldset>
	    	
	      <label for="nameMod">Name</label>
	      <input type="text" name="name" id="nameMod" value="Jane Smith" class="text ui-widget-content ui-corner-all">
	      <label for="emailMod">Email</label>
	      <input type="text" name="email" id="emailMod" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
	      <label for="passwordMod">Password</label>
	      <input type="password" name="password" id="passwordMod" value="1234" class="text ui-widget-content ui-corner-all">
	 
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

