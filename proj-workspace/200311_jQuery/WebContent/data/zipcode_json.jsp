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
	String strDong = request.getParameter("dong");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	JSONArray jsonArray = new JSONArray();
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); //톰캣 환경설정에 접근
		DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb"); //커넥션 풀링(Datasource) 접근(context.xml 이용)

		conn = dataSource.getConnection();//풀링에서 커넥션 가져옴

		//out.println("연결성공\n"); error

		String sql = "SELECT seq, zipcode, sido, gugun, dong, ri, bunji FROM zipcode WHERE dong LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, strDong + "%");
		
		rs = pstmt.executeQuery();


		while (rs.next()) {
			String seq = rs.getString("seq");
			String zipcode = rs.getString("zipcode");
			String sido = rs.getString("sido");
			String gugun = rs.getString("gugun");
			String dong = rs.getString("dong");
			String ri = rs.getString("ri");
			String bunji = rs.getString("bunji");
			
			
			JSONObject jobj = new JSONObject();
			jobj.put("seq", rs.getString("seq"));
			jobj.put("zipcode", rs.getString("zipcode"));
			jobj.put("sido", rs.getString("sido"));
			jobj.put("gugun", rs.getString("gugun"));
			jobj.put("dong", rs.getString("dong"));
			jobj.put("ri", rs.getString("ri"));
			jobj.put("bunji", rs.getString("bunji"));
			
			jsonArray.add(jobj);
		}

		out.println(jsonArray);

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

