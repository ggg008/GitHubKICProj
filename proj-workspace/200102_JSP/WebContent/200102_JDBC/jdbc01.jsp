<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 자바소스코드를 참조하여... -->
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
	String url = "jdbc:mysql://127.0.0.1:3306/employees";
	String user = "root";
	String password = "123456";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);

			//out.println("연결성공");
			String sql = String.format("SELECT * FROM dept");
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			out.println("<table width = '600' border = '1'>");
			while(rs.next()){
				out.println("<tr>");
				out.println("	<td>" + rs.getString("deptno") + "</td>");
				out.println("	<td>" + rs.getString("dname") + "</td>");
				out.println("	<td>" + rs.getString("loc") + "</td>");
				out.println("</tr>");
			}

		} catch (ClassNotFoundException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>