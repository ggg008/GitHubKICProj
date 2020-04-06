<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
	body { font-size: 70%; }
	#accordion > div > div:last-child { text-align: right; }
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
	$( document ).ready( function() {
		$( '#writeDialog' ).css( 'display', 'none' );
		$( '#modifyDialog' ).css( 'display', 'none' );
		$( '#deleteDialog' ).css( 'display', 'none' );
	
		$( '#accordion' ).accordion({
			collapsible: 'true',
			heightStyle: 'content'
		});
		
		var readServer = function() {
			$.ajax({
				url : 'list.json',
				type: "get",
				dataType: "json",
				success: function(json) {
					$("#accordion").empty();
					
					var html = "";
					$.each(json.data, function(i, elt) {
						
						html += "<h3>" + elt.seq + " : " + elt.writer + "(" + elt.hit +") new</h3>";
						html += "<div>";
						html += "	<div>"+ elt.wdate +  "</div>";
						html += "	<div>" + elt.subject +"</div>";
						html += "	<br />";
						html += "	<hr noshade='noshade' />";
						html += "	<div>" + elt.content +"</div>";
						html += "	<br />";
						html += "	<hr noshade='noshade' />";
						html += "	<br />";
						html += "	<div>";
						html += "		<button idx='"+ elt.seq +"' action='modify' class='action'>수정</button>";
						html += "		<button idx='"+ elt.seq +"' action='delete' class='action'>삭제</button>";
						html += "	</div>";
						html += "</div>";						
						
						console.log(elt.seq);
						
					})
					$("#accordion").append(html);
					$("#accordion").accordion("refresh");
					
					$( 'button.action' ).button();
				},
				error: function() {
					alert("서버 에러");
				}
			});
			
			
		};
		
		readServer();
		
		$( document ).on( 'click', 'button.action', function() {
			if( $( this).attr('action') == 'write') {
	                $('#writeDialog').dialog({
	                    width: 700,
	                    height: 500,
	                    modal: true,
	                    buttons: {
	                        '글쓰기': function() {
	                            $(this).dialog("close");
	                        },
	                        '취소': function() {
	                            $(this).dialog("close");
	                        }
	                    },
	                    close: function() {
	                    }
	                });
	            } else if($(this).attr('action') == 'modify') {
	                $('#modifyDialog').dialog({
	                    width: 700,
	                    height: 500,
	                    modal: true,
	                    buttons: {
	                        '수정': function() {
	                            $(this).dialog("close");
	                        },
	                        '취소': function() {
	                            $(this).dialog("close");
	                        }
	                    },
	                    close: function() {
	                    }
	                });               
	            } else if($(this).attr('action') == 'delete') {
	                $('#deleteDialog').dialog({
	                    width: 700,
	                    height: 200,
	                    modal: true,
	                    buttons: {
	                        '삭제': function() {
	                            $(this).dialog("close");
	                        },
	                        '취소': function() {
	                            $(this).dialog("close");
	                        }
	                    },
	                    close: function() {
	                    }
	                });
	            } else {
	            }
	        });
	    });
</script>
</head>
<body>
<div id="accordion-resizer">
	<hr noshade="noshade" />
	<div id="accordion">
		
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
			<input type="text" id="w_subject" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
			<input type="text" id="w_writer" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
			<input type="text" id="w_mail" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="password" class="header">비밀&nbsp;번호</label>
			<input type="password" id="w_password" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="content" class="header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
			<br /><br />
			<textarea rows="15" cols="100" id="w_content" class="text ui-widget-content ui-corner-all"></textarea>
		</div>
	</fieldset>
</div>
<div id="modifyDialog" title="글수정">   
	<fieldset>
		<div>
			<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
			<input type="text" id="m_subject" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
			<input type="text" id="m_writer" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
		</div>
		<div>
			<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
			<input type="text" id="m_mail" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="password" class="header">비밀&nbsp;번호</label>
			<input type="password" id="m_password" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="content" class="header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
			<br /><br />
			<textarea rows="15" cols="100" id="m_content" class="text ui-widget-content ui-corner-all"></textarea>
		</div>
	</fieldset>
</div>
<div id="deleteDialog" title="글삭제">   
	<fieldset>
		<div>
			<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
			<input type="text" id="d_subject" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
		</div>
		<div>
			<label for="password" class="header">비밀&nbsp;번호</label>
			<input type="password" id="d_password" class="text ui-widget-content ui-corner-all"/>
		</div>
	</fieldset>
</div>
</body>
</html>
