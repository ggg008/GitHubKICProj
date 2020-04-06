<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>


<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	

	Connection conn = null;
	PreparedStatement pstmt = null;

	JSONArray jsonArray = new JSONArray();
	int flag = 1;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); //톰캣 환경설정에 접근
		DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb"); //커넥션 풀링(Datasource) 접근(context.xml 이용)

		conn = dataSource.getConnection();//풀링에서 커넥션 가져옴

		//out.println("연결성공\n"); error

		String sql = "UPDATE users SET name=?, email=?, password=? WHERE seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, password);
		pstmt.setString(4, seq);
		
		int result = pstmt.executeUpdate();
		if(result == 1 ){
			flag = 0;
		}		

	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}


	JSONObject jobj = new JSONObject();
	jobj.put("flag", flag);

	out.println(jobj);
%>

