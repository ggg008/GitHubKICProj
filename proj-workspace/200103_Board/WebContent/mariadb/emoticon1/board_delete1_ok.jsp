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

	String cpage = request.getParameter("cpage");
	String seq = request.getParameter("seq");
	String password = request.getParameter("password");

	Connection conn = null;
	PreparedStatement pstmt = null;

	int flag = 1;

	try {

		Context initCtx = new InitialContext();//톰캣 환경설정에 접근
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//커넥션 풀링 접근(context 이용하여)
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
		
		conn = dataSource.getConnection();//풀링에서 커넥션 가져옴

		String sql = "DELETE FROM emot_board1 WHERE seq=? AND password=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		pstmt.setString(2, password);

		int result = pstmt.executeUpdate();
		// 0 - 비밀번호가 틀렸을경우
		// 1 - 맞을경우
		if (result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
				

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
		out.println("alert('글삭제에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");
	} else if (flag == 1) {
		out.println("alert('비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('글삭제에 실패했습니다.');");
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