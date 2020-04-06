<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 임포트 -->
<%@ page import="java.util.Calendar"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%
	request.setCharacterEncoding("UTF-8");//문자 인코딩 //받는곳에선 항상 쓸것

	String dong = request.getParameter("dong");

	StringBuffer sb = new StringBuffer();

	if (dong != null) {

		String url = "jdbc:mysql://127.0.0.1:3306/employees";
		String user = "root";
		String password = "123456";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);

			String sql = String.format("SELECT * FROM zipcode WHERE dong like ?");
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dong != null ? dong : "");

			rs = pstmt.executeQuery();

			out.println("<table width = '1000' border = '1'>");
			int cnt = 0;

			while (rs.next()) {
				sb.append("<tr>");
				sb.append("	<td>" + rs.getString("zipcode") + "</td>");
				sb.append("	<td>" + rs.getString("sido") + "</td>");
				sb.append("	<td>" + rs.getString("gugun") + "</td>");
				sb.append("	<td>" + rs.getString("dong") + "</td>");
				sb.append("	<td>" + rs.getString("ri") + "</td>");
				sb.append("	<td>" + rs.getString("bunji") + "</td>");
				sb.append("	<td>" + rs.getString("seq") + "</td>");
				sb.append("</tr>");

			}

		} catch (ClassNotFoundException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
		}

		sb.append("</table>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="myZipSearchJsp.jsp" method="get">
		동이름 : &nbsp;<input type="text" name="dong"> &nbsp; 
		<input
			type="submit" value="입력완료">
		<hr>
	</form>
	<%=sb.toString()%>
</body>
</html>