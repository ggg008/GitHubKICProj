<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding( "utf-8" );
	
	StringBuffer result = new StringBuffer();
	if(request.getParameter( "dong" ) != null) {
		String url = "jdbc:mysql://localhost:3306/employees";
		String user = "root";
		String password = "123456";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dong = request.getParameter( "dong" );
		try {
			Class.forName( "org.mariadb.jdbc.Driver" );
			conn = DriverManager.getConnection( url, user, password );
			
			String sql = "select * from zipcode where dong like ?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, dong + '%' );
			rs = pstmt.executeQuery();
			result.append( "<table width='800' border='1'>" );
			while( rs.next() ) {
				result.append( "<tr>" );
				result.append( "    <td>" + rs.getString( "zipcode" ) + "</td>" );
				result.append( "    <td>" + rs.getString( "sido" ) + "</td>" );
				result.append( "    <td>" + rs.getString( "gugun" ) + "</td>" );
				result.append( "    <td>" + rs.getString( "dong" ) + "</td>" );
				result.append( "    <td>" + ( rs.getString( "ri" )==null ? "" : rs.getString( "ri" ) )+ "</td>" );
				result.append( "    <td>" + ( rs.getString( "bunji" )==null ? "" : rs.getString( "bunji" ) ) + "</td>" );
				result.append( "</tr>");
			}
			result.append( "</table>" );
		} catch( ClassNotFoundException e ) {
			result.append( "[에러] + " + e.getMessage() );
		} catch(SQLException e) {
			result.append( "[에러] + " + e.getMessage() );
		} finally {
			if( rs != null ) rs.close();
			if( pstmt != null ) pstmt.close();
			if( conn != null ) conn.close();
		}
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<table width="800" border="1">
<tr>
	<td>
		<form action="zipsearch01.jsp" method="post">
			<input type="text" name="dong" id="dong" size="40" placeholder="동이름 입력"/>
			<input type="submit" value="우편번호검색">
		</form>
	</td>
</tr>
</table>
<hr />
<%=result %>
</body>
</html>