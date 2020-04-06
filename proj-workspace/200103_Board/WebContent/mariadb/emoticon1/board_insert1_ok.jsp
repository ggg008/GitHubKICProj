<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- pool 추가된 부분(DriverManager대신 사용) -->
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>
<!--  -->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	int flag = 1;

	try {

		/* 
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		 */
		Context initCtx = new InitialContext();//톰캣 환경설정에 접근
		Context envCtx = (Context) initCtx.lookup("java:comp/env");//커넥션 풀링 접근(context 이용하여)
		DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");

		conn = dataSource.getConnection();//풀링에서 커넥션 가져옴

		
		String sql = "insert into emot_board1 values(0, ?, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		for (int i = 0; i < 100; ++i) {
			pstmt.setString(1, "제목 " + i);
			pstmt.setString(2, "이름");
			pstmt.setString(3, "test@test.com");
			pstmt.setString(4, "123");
			pstmt.setString(5, "내용 " + i);
			
			Random rand = new Random();
			int min = 1, max = 50;
			int randomNum = rand.nextInt(max - min + 1) + min;
			pstmt.setString(6, String.format("emot%02d", randomNum));
			pstmt.setString(7, "000.000.000.000");				

			int result = pstmt.executeUpdate();
		}
		

		//} catch(ClassNotFoundException e){
	} catch (NamingException e) {
		System.out.println(e.getClass().getName() + " : " + e.getMessage());
	} catch (SQLException e) {
		System.out.println(e.getClass().getName() + " : " + e.getMessage());
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();//jsp 가 자동으로 try를 추가함을 유의
	}

	/* if(flag == 0) {
		response.sendRedirect("board_list1.jsp");
	} else {
		response.sendRedirect("board_write1.jsp");
	} */
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
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