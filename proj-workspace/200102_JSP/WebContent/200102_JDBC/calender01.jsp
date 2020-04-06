
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.td1{color: red;}
	.td2{color: blue;}
	.td3{font-weight: bold;}
</style>
</head>
<body>
	<%
		//일요일은 글자색을 레드
		//토요일은 글자색을 블루		
		//오늘은 글자를 볼드
		StringBuffer sb = new StringBuffer();

		int year = 2020;
		int month = 1;
		int START_DAY_OF_WEEK = 0;
		int END_DAY = 0;
		
		Calendar today = Calendar.getInstance();
		

		Calendar sDay = Calendar.getInstance();
		Calendar eDay = Calendar.getInstance();

		sDay.set(year, month - 1, 1);

		eDay.set(year, month, 1 - 1);

		START_DAY_OF_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
		int END_DAY_OF_WEEK = eDay.get(Calendar.DAY_OF_WEEK);
		END_DAY = eDay.get(Calendar.DATE);

		sb.append("<table width = '700' border = '1'>");
		sb.append("<tr>");
		sb.append("   <td>" + year + "년 " + month + "월</td>");
		sb.append("</tr>");

		sb.append("<tr>");
		sb.append("<td>SU</td>");
		sb.append("<td>MO</td>");
		sb.append("<td>TU</td>");
		sb.append("<td>WE</td>");
		sb.append("<td>TH</td>");
		sb.append("<td>FR</td>");
		sb.append("<td>SA</td>");
		sb.append("</tr>");

		sb.append("<tr>");
		for (int i = 1; i < START_DAY_OF_WEEK; i++) {
			sb.append("<td></td>");
		}

		for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
			if (n % 7 == 1)
				sb.append("<tr>");
			
			String td = "white";

			if (n % 7 == 1) {
				td = "td1";
			} else if (n % 7 == 0) {
				td = "td2";
			}
			if (i == today.get(Calendar.DATE)) {
				td = "td3";
			} 
			
			
			sb.append("<td class="+ td + " width = '70'>");
			sb.append((i < 10) ? "  " + i : " " + i);
			sb.append("</td>");

			if (n % 7 == 0)
				sb.append("</tr>");
		}

		for (int i = END_DAY_OF_WEEK; i <= 6; ++i) {
			sb.append("<td></td>");
		}

		sb.append("</table>");
		out.print(sb.toString());
	%>
</body>
</html>