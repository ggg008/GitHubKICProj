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

#dialog label, #dialog input {
	display: block;
}

#dialog label {
	margin-top: 0.5em;
}

#dialog input, #dialog textarea {
	width: 95%;
}

#tabs {
	margin-top: 1em;
}

#tabs li .ui-icon-close {
	float: left;
	margin: 0.4em 0.2em 0 0;
	cursor: pointer;
}

#add_tab {
	cursor: pointer;
}
</style>

<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript">
	// $(document).ready() : jQuery 시작점 == main
	$(document).ready(function() {
		$('#menu').menu();
	})
	
	$( function() {
		var tabTitle = $( "#tab_title"),
		tabContent = $("#tab_content"),
		tabTemplate = "<li><a href='\#{href}'>\#{label}</a> <span class='ui-icon ui-icon-close' role='presentation'>Remove Tab</span></li>",
		tabCounter = 2;
		
		var tabs = $("#tabs").tabs();
		
		// Modal dialog init: custom buttons and a "close" callback resetting the form inside
		var dialog = $("#dialog").dialog({
			autoOpen: false,
			modal: true,
			buttons: {
				Add: function() {
					addTab();
					$(this).dialog("close");
				},
				Cancel: function() {
					$(this).dialog("close");
				}
			},
			close: function() {
				form[0].reset();
			}			
		});
		
		// AddTab form: calls addTab function on submit and closes the dialog
		var form = dialog.find("form").on("submit", function(event) {
			addTab();
			dialog.dialog("close");
			event.preventDefault();
		})
		
		// Actual addTab function: adds new tab using the input from the form above
		function addTab() {
			var label = tabTitle.val() || "Tab " + tabCounter,
			id = "tabs-" + tabCounter,
			li = $(tabTemplate.replace(/#\{href\}/g, "#" + id).replace(/#\{label\}/g, label)),
			tabContentHtml = tabContent.val() || "Tab " + tabCounter + " content.";
			
			tabs.find(".ui-tabs-nav").append(li);
			tabs.append("<div id='" + id + "'><p>" + tabContentHtml + "</p></div>");
			tabs.tabs("refresh");
			tabCounter++;
		}
		
		// AddTab button: just opens the dialog
		$("#add_tab").button().on("click", function() {
			dialog.dialog("open");
		})
		
		
		// Close icon: removing the tab on click
		tabs.on("click", "span.ui-icon-close", function() {
			var panelID = $( this ).closest("li").remove().attr("aria-controls");
			$( "#" + panelID).remove();
			tabs.tabs("refresh");
		})
		
		tabs.on("keyup", function(event) {
			if(event.altKey && event.keyCode === $.ui.keyCode.BACKSPACE){
				var panelID = tabs.find(".ui-tabs-active").remove().attr("aria-controls");
				$( "#" + panelID).remove();
				tabs.tabs("refresh");
			}
		})
		
		
	})
</script>
</head>
<body>

	<div id="dialog" title="Tab data">
		<form>
			<fieldset class="ui-helper-reset">
				<label for="tab_title">Title</label> <input type="text"
					name="tab_title" id="tab_title" value="Tab Title"
					class="ui-widget-content ui-corner-all"> <label
					for="tab_content">Content</label>
				<textarea name="tab_content" id="tab_content"
					class="ui-widget-content ui-corner-all">Tab content</textarea>
			</fieldset>
		</form>
	</div>

	<button id="add_tab">Add Tab</button>

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Nunc tincidunt</a> <span
				class="ui-icon ui-icon-close" role="presentation">Remove Tab</span></li>
		</ul>
		<div id="tabs-1">
			<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a,
				risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris.
				Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem.
				Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo.
				Vivamus sed magna quis ligula eleifend adipiscing. Duis orci.
				Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam
				molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut
				dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique
				tempus lectus.</p>
		</div>
	</div>

</body>
</html>

