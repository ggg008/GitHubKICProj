<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelPaging.MasUsersTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("idinput");
	String password = request.getParameter("pwinput");

    String saved_id = "";
    String saved_password = "";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
      try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
            
            conn = dataSource.getConnection();
            String sql = "select id, password from users where id = ? and password = ?"; 
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
           
            if (rs.next()) {
                  saved_id = rs.getString("id");
                  saved_password = rs.getString("password");
            }
            
      } catch (NamingException e) {
            System.out.println("에러 : " + e.getMessage());
      } catch (SQLException e) {
            System.out.println("에러 : " + e.getMessage());
      } finally {
           if (rs != null) rs.close();
           if (pstmt != null) pstmt.close();
           if (conn != null) conn.close();
     }
     
    
    int flag;
    
    if(id.equals("") && password.equals("")) {
        flag = 0;
    } else if(id.equals(saved_id) && password.equals(saved_password)) {
        session.setAttribute("sess_id", id);
        flag = 1;
    } else {
    	flag = 2;
    }
    
    out.println("<script type='text/javascript'>");
    if(flag == 1) {
          out.println("alert('로그인 되었습니다.');");
          out.println("location.href='index.do';");
    } else if(flag == 0){
          out.println("alert('아이디 혹은 비밀번호를 입력해주세요.');");
          out.println("history.back()");
    } else if(flag == 2) {
      out.println("alert('아이디 혹은 비밀번호가 다릅니다.');");
        out.println("history.back()");
    }
    out.println("</script>");
    
    
%>