<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("signupId");
	String email = request.getParameter("signupEmail");
	String password = request.getParameter("signupPassword");
	String cpassword = request.getParameter("signupCpassword");
	
	int flag = 1;
	
	out.println("<script type='text/javascript'>");
	
	if(!password.equals(cpassword)) {
		out.println("alert('비밀번호 확인이 올바르지 않습니다.');");
        out.println("history.back()");
	} else if(password.length() < 6) {
		out.println("alert('비밀번호를 6자리 이상 입력하셔야 합니다.');");
        out.println("history.back()");
	} else {
		flag = 0;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	if(flag == 0) {
		
		//out.println("alert('회원가입이 완료되었습니다.');");
        //out.println("location.href='../../authentication-login.html';");
        
      
		/* =====JDBC============================================================
        |																		|
        | create database maschart;											 	|
        |																		|
		| create table signup (													|
		|	id            	varchar(50)     not null		primary key,		|
		|	email  	      	varchar(100)    not null, 	   						|
		|	name          	varchar(50),										|
		|	password      	varchar(50)     not null,							|
		|	wdate         	datetime        not null,							|
		|	userimgname		varchar(200),										|
		|	userimgsize		int													|
		|   );																	|
		|																		|																							|
        ====================================================================== */
		
        try {
        		Context initCtx = new InitialContext();
				Context envCtx = (Context)initCtx.lookup("java:comp/env");
				DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
				conn = dataSource.getConnection();
		
				String sql = "insert into signup values (?, ?, null, ?, now(), null, null)";
    		    pstmt = conn.prepareStatement(sql);
   	  	 	    pstmt.setString(1, id);
    		    pstmt.setString(2, email);
    		    pstmt.setString(3, password);
        
     		   int result = pstmt.executeUpdate();
     		   if(result == 1) {
     			  flag = 2;
     		   }
     		   
        
        } catch(NamingException e) {
        	System.out.println("에러:" + e.getMessage());
        } catch(SQLException e) {
        	System.out.println("에러:" + e.getMessage());
        } finally {
        	if(pstmt != null) pstmt.close();
        	if(conn != null) conn.close();
        }

		
		if(flag == 2) {
			out.println("alert('회원가입이 완료되었습니다.')");
	        out.println("location.href='../../authentication-login.html';");
		} else {
			out.println("alert('회원가입에 실패하였습니다.')");
			out.println("history.back();");
		}
	}
	out.println("</script>");
%>