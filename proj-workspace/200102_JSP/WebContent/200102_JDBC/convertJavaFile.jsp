<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		StringBuffer sb = new StringBuffer();

		int year = 20;
		int month = 2;
		int START_DAY_OF_WEEK = 0;
		int END_DAY = 0;

		Calendar sDay = Calendar.getInstance();
		Calendar eDay = Calendar.getInstance();

		sDay.set(year, month - 1, 1);

		eDay.set(year, month, 1 - 1);
		eDay.add(Calendar.DATE, -1);

		START_DAY_OF_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
		END_DAY = eDay.get(Calendar.DATE);

		sb.append("<table width = '700' border = '1'>");
		sb.append("<tr>");
		sb.append("<td colspan='7' align='center'>" + year + "년 " + month + "월</td>");
		sb.append("</tr>");

		sb.append("<tr>");
		sb.append("<td width = '70'>SU</td>");
		sb.append("<td width = '70'>MO</td>");
		sb.append("<td width = '70'>TU</td>");
		sb.append("<td width = '70'>WE</td>");
		sb.append("<td width = '70'>TH</td>");
		sb.append("<td width = '70'>FR</td>");
		sb.append("<td width = '70'>SA</td>");
		sb.append("</tr>");

		sb.append("<tr>");
		for (int i = 1; i < START_DAY_OF_WEEK; i++) {
			sb.append("<td></td>");
		}

		for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
			sb.append("<td width = '70'>");
			sb.append((i < 10) ? "  " + i : " " + i);
			sb.append("</td>");
			if (n % 7 == 0)
				sb.append("</tr>");
		}
		sb.append("</table>");
		out.print(sb.toString());
	%>
</body>
</html>