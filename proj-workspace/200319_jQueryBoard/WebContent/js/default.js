//자바스크립트 분리하기
var readServer = function() {
	alert('readserver')
/*
	$('#accordion').accordion({
		collapsible : 'true',
		heightStyle : 'content'
	});
	$('button.action').button();
	*/
};


$(document).ready(function() {
	$('#writeDialog').css('display', 'none');
	$('#modifyDialog').css('display', 'none');
	$('#deleteDialog').css('display', 'none');

	$('#accordion').accordion({
		collapsible : 'true',
		heightStyle : 'content'
	});
	$('button.action').button();
	
	readServer();

	$(document).on('click', 'button.action', function() {
		if ($(this).attr('action') == 'write') {
			$('#writeDialog').dialog({
				width : 700,
				height : 500,
				modal : true,
				buttons : {
					'글쓰기' : function() {
						$(this).dialog("close");
					},
					'취소' : function() {
						$(this).dialog("close");
					}
				},
				close : function() {
				}
			});
		} else if ($(this).attr('action') == 'modify') {
			$('#modifyDialog').dialog({
				width : 700,
				height : 500,
				modal : true,
				buttons : {
					'수정' : function() {
						$(this).dialog("close");
					},
					'취소' : function() {
						$(this).dialog("close");
					}
				},
				close : function() {
				}
			});
		} else if ($(this).attr('action') == 'delete') {
			$('#deleteDialog').dialog({
				width : 700,
				height : 200,
				modal : true,
				buttons : {
					'삭제' : function() {
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
		}
	});
});
