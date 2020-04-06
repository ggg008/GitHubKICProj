<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>
<%@page import="java.sql.DriverManager"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); //톰캣 환경설정에 접근
		DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb"); //커넥션 풀링(Datasource) 접근(context.xml 이용)

		conn = dataSource.getConnection();//풀링에서 커넥션 가져옴

		//out.println("연결성공\n"); error

		String sql = "SELECT * FROM books";
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		StringBuffer sb = new StringBuffer();

		sb.append("[");
		while (rs.next()) {
			sb.append("{");
			sb.append("\"name\": \"" + rs.getString("name") + "\",");
			sb.append("\"publisher\": \"" + rs.getString("publisher") + "\",");
			sb.append("\"author\" : \"" + rs.getString("author") + "\",");
			sb.append("\"price\" : \"" + rs.getString("price") + "원\"");
			sb.append("},");
		}
		sb.append("]");
		
		sb.deleteCharAt(sb.lastIndexOf(","));
		
		out.println(sb);
		

	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>

