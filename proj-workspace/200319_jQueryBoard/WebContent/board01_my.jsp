<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%=request.getServletPath()%></title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
body {
	font-size: 70%;
}

#accordion>div>div:last-child {
	text-align: right;
}

#accordion-resizer {
	margin: 0 60px;
	max-width: 1500px;
}

#btngroup {
	text-align: right;
}

#btngroup button {
	margin: 3px;
	padding: 3px;
	width: 100px;
}

label.header {
	font-size: 10pt;
	margin-right: 5px;
}

input.text {
	width: 80%;
	margin-bottom: 12px;
	padding: 0.4em;
}

fieldset {
	margin-left: 15px;
	margin-top: 15px;
	border: 0;
}
</style>
<script type="text/javascript" src="./js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#writeDialog').css('display', 'none');
		$('#modifyDialog').css('display', 'none');
		$('#deleteDialog').css('display', 'none');
		

		$('#accordion').accordion({
			collapsible : 'true',
			heightStyle : 'content'
		});
		$('button.action').button();

		/* 
		var readServer = function() {
			$('#accordion').accordion({
				collapsible : 'true',
				heightStyle : 'content'
			});
			$('button .action').button();
		};
		 */

		readServer();
		 
		 
		$(document).on('click', 'button.action', function() {
			if ($(this).attr('action') == 'write') {
				$('#writeDialog').dialog({
					width : 700,
					height : 500,
					modal : true,
					buttons : {
						'글쓰기' : function() {
							writeServer();
							$(this).dialog("close");
						},
						'취소' : function() {
							$(this).dialog("close");
						}
					},
					close : function() {
					}
				});
			} 
			
		});
	});
	
	var readServer = function() {		
		//$('#accordion').empty();
		$.ajax({
			// 다국어이면 url 인코딩
			url : './list.json',					
			type : 'get',
			dataType : 'json',
			success : function(data) {				
				$('#accordion').empty();
				console.log("성공");
				$.each(data.data, function(i, element) {
					var html = "";

					//js객체이기때문에 직접접근. jsonajax01 참고
					//console.log(element);
					//console.log(element.subject);
					//console.log($(element).find("seq").val());
					
					/*
					<h3>1 : 글쓴이(0) new</h3>
					<div>
						<div>2016-02-01</div>
						<div>제목 1</div>
						<br />
						<hr noshade="noshade" />
						<div>내용 1</div>
						<br />
						<hr noshade="noshade" />
						<br />
						<div>
							<button idx="1" action="modify" class="action">수정</button>
							<button idx="1" action="delete" class="action">삭제</button>
						</div>
						       
					</div>
					*/
					html += "<h3>" + element.seq + " : " + element.writer + "</h3>";
					html += "<div>";
					html += "	<div>"+ element.wdate +  "</div>";
					html += "	<div>" + element.subject +"</div>";
					html += "	<br />";
					html += "	<hr noshade='noshade' />";
					html += "	<div>" + element.content +"</div>";
					html += "	<br />";
					html += "	<hr noshade='noshade' />";
					html += "	<br />";
					html += "	<div>";
					html += "		<button id='mod"+ i +"' action='modify' class='action'>수정</button>";
					html += "		<button id='del"+ i +"' action='delete' class='action'>삭제</button>";
					html += "	</div>";
					html += "</div>";
					
					$("#accordion" ).append(html);
					$('#mod' + i ).button().on('click', function(e) {
						showModyfiDialog(element.seq);				
					})
										
					$('#del' + i ).button().on('click', function(e) {
						showDeleteDialog(element.seq);
					})
				})
				$("#accordion").accordion('refresh');
				
				
			},
			error : function(error) {
				// 404일때
				console.log('실패 : ' + error.status);
				console.log(error.responseText);
			}
		})
	}

	var writeServer = function() {
		$.ajax({
			// 다국어이면 url 인코딩
			url : './write_ok.json',
			data: {
				subject : $('#w_subject').val(),
				writer : $('#w_writer').val(),
				mail : $('#w_mail').val(),
				password : $('#w_password').val(),
				content : $('#w_content').val(),
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;
				
				if(json.flag == 0) {
					alert('글쓰기에 성공했습니다.');
					readServer();
				} else {
					alert('글쓰기에 실패했습니다.');
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
	
	var showModyfiDialog = function(seq) {
		$.ajax({
			// 다국어이면 url 인코딩
			url : './modify.json',
			data: {
				seq : seq
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;					
				if(json.flag == 0){
					
					var data = json.data;
					//console.log(data.subject);
					
					$('#m_subject').val(data.subject);
					$('#m_writer').val(data.writer);
					$('#m_mail').val(data.mail);
					$('#m_content').val(data.content);
					$('#m_password').val('');
					 
					$('#modifyDialog').dialog({
						width : 700,
						height : 500,
						modal : true,
						buttons : {
							'수정' : function() {
								modServer(seq);
								$(this).dialog("close");
							},
							'취소' : function() {
								$(this).dialog("close");
							}
						},
						close : function() {
						}
					});
					
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
	
	var modServer = function(seq) {
		$.ajax({
			// 다국어이면 url 인코딩
			url : './modify_ok.json',
			data: {
				seq : seq,
				password : $('#m_password').val(),
				subject : $('#m_subject').val(),
				mail : $('#m_mail').val(),
				content : $('#m_content').val(),
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;
				if(json.flag == 0) {
					alert('글수정에 성공했습니다.');					
					readServer();
					
				} else if(json.flag == 1) {
					alert('비밀번호가 틀립니다.');
				} else {
					alert('글수정에 실패했습니다.');
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
	
	var showDeleteDialog = function(seq) {
		$.ajax({
			// 다국어이면 url 인코딩
			url : './delete.json',
			data: {
				seq : seq
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;					
				if(json.flag == 0){
					
					var data = json.data;
					//console.log(data.subject);
					
					$('#d_subject').val(data.subject);
					$('#d_password').val('');
					
					$('#deleteDialog').dialog({
						width : 700,
						height : 200,
						modal : true,
						buttons : {
							'삭제' : function() {
								delServer(seq);
								$(this).dialog("close");
							},
							'취소' : function() {
								$(this).dialog("close");
							}
						},
						close : function() {
						}
					});
					
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
			url : './delete_ok.json',
			data: {
				seq : seq,
				password : $('#d_password').val(),
			},
			type : 'get',
			dataType : 'json',
			success : function(json) {				
				//return json.flag;
				if(json.flag == 0) {
					alert('글삭제에 성공했습니다.');					
					readServer();
					
				} else if(json.flag == 1) {
					alert('비밀번호 틀립니다.');
				} else {
					alert('글삭제에 실패했습니다.');
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
	<div id="accordion-resizer">
		<hr noshade="noshade" />
		<div id="accordion">
			<h3>1 : 글쓴이(0) new</h3>
			<div>
				<div>2016-02-01</div>
				<div>제목 1</div>
				<br />
				<hr noshade="noshade" />
				<div>내용 1</div>
				<br />
				<hr noshade="noshade" />
				<br />
				<div>
					<button idx="1" action="modify" class="action">수정</button>
					<button idx="1" action="delete" class="action">삭제</button>
				</div>
				       
			</div>
			<h3>2 : 글쓴이(0) new</h3>
			<div>
				<div>2016-02-01</div>
				<div>제목 2</div>
				<br />
				<hr noshade="noshade" />
				<div>내용 2</div>
				<br />
				<hr noshade="noshade" />
				<br />
				<div>
					<button idx="2" action="modify" class="action">수정</button>
					<button idx="2" action="delete" class="action">삭제</button>
				</div>
				       
			</div>
		</div>
		<hr noshade="noshade" />
		<div id="btngroup">
			<button action="write" class="action">글쓰기</button>
		</div>
	</div>
	<div id="writeDialog" title="글쓰기">
		   
		<fieldset>
			<div>
				<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				<input type="text" id="w_subject"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
				<input type="text" id="w_writer"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
				<input type="text" id="w_mail"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="password" class="header">비밀&nbsp;번호</label> <input
					type="password" id="w_password"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="content" class="header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
				<br />
				<br />
				<textarea rows="15" cols="100" id="w_content"
					class="text ui-widget-content ui-corner-all"></textarea>
			</div>
		</fieldset>
	</div>
	<div id="modifyDialog" title="글수정">
		   
		<fieldset>
			<div>
				<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				<input type="text" id="m_subject"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
				<input type="text" id="m_writer"
					class="text ui-widget-content ui-corner-all" readonly="readonly" />
			</div>
			<div>
				<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
				<input type="text" id="m_mail"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="password" class="header">비밀&nbsp;번호</label> <input
					type="password" id="m_password"
					class="text ui-widget-content ui-corner-all" />
			</div>
			<div>
				<label for="content" class="header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
				<br />
				<br />
				<textarea rows="15" cols="100" id="m_content"
					class="text ui-widget-content ui-corner-all"></textarea>
			</div>
		</fieldset>
	</div>
	<div id="deleteDialog" title="글삭제">
		   
		<fieldset>
			<div>
				<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				<input type="text" id="d_subject"
					class="text ui-widget-content ui-corner-all" readonly="readonly" />
			</div>
			<div>
				<label for="password" class="header">비밀&nbsp;번호</label> <input
					type="password" id="d_password"
					class="text ui-widget-content ui-corner-all" />
			</div>
		</fieldset>
	</div>
</body>
</html>
