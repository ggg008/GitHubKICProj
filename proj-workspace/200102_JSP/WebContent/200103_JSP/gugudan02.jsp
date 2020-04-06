<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 무조건
	request.setCharacterEncoding("utf-8");

	String result = "";
	if(request.getParameter( "startdan" ) != null && request.getParameter( "startdan" ) != null) { 
		int startDan = Integer.parseInt( request.getParameter( "startdan" ));
		int endDan = Integer.parseInt( request.getParameter( "enddan" ));
		
		result += "<table width='800' border='1'>";
		for( int i=startDan ; i<=endDan ; i++ ) {
			result += "<tr>";
			for( int j=1 ; j<=9 ; j++ ) {
				result += "<td>" + i + " X " + j + " = " + (i*j)+ "</td>";
			}
			result += "</tr>";
		}
		result += "</table>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="gugudan02.jsp" method="post">
시작단 <input type="text" name="startdan" />
-
끝단 <input type="text" name="enddan" />
<input type="submit" value="구구단 보기" />
</form>

<hr />

<%= result %>

</body>
</html>