<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String mail = "";
	if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
		mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	}
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String wip = request.getRemoteAddr();//사용자 아이피
	
	
	/* System.out.println(writer);
	System.out.println(subject);
	System.out.println(password);
	System.out.println(content);
	System.out.println(mail);
	System.out.println(wip); */
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 1;
	
	try {
		String url = "jdbc:mysql://localhost:3306/project";
		String user = "project";
		String pass = "123456";
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "insert into board1 values(0, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, writer);
		pstmt.setString(3, mail);
		pstmt.setString(4, password);
		pstmt.setString(5, content);
		pstmt.setString(6, wip);
		
		int result = pstmt.executeUpdate();
		if(result == 1) {
			flag = 0;
		} 
		
		
	} catch(ClassNotFoundException e){
		System.out.println(e.getClass().getName() + " : " + e.getMessage());
	} catch(SQLException e){
		System.out.println(e.getClass().getName() + " : " + e.getMessage());
	} finally {
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();//jsp 가 자동으로 try를 추가함을 유의
	}
	
	/* if(flag == 0) {
		response.sendRedirect("board_list1.jsp");
	} else {
		response.sendRedirect("board_write1.jsp");
	} */
	
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('글쓰기에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");
	} else {
		out.println("alert('글쓰기에 실패했습니다.');");
		out.println("history.back();");
	}	
	out.println("</script>");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>