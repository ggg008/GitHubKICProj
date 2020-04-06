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
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
	request.setCharacterEncoding("utf-8");

	String cpage = request.getParameter("cpage");
	String seq = request.getParameter("seq");

	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String mail = "";
	if (!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
		mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	}
	String password = request.getParameter("password");
	String content = request.getParameter("content");

	content = request.getParameter("content").replaceAll("\n", "<br>");
	content = request.getParameter("content").replaceAll(" ", "&nbsp;");

	String wip = request.getRemoteAddr();//사용자 아이피

	//System.out.println(content);

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

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

		//부모글(seq)에 대한 정보
		String sql = "SELECT grp, grps, grpl FROM rep_board1 WHERE seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);

		rs = pstmt.executeQuery();

		int grp = 0;
		int grps = 0;
		int grpl = 0;
		if (rs.next()) {
			grp = rs.getInt("grp");
			grps = rs.getInt("grps");
			grpl = rs.getInt("grpl");
		}

		//업데이트를 위해서...
		sql = "UPDATE rep_board1 SET grps=grps+1 WHERE grp=? AND grps > ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, grp);
		pstmt.setInt(2, grps);

		pstmt.executeUpdate();

		sql = "insert into rep_board1 values(0, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, grp);
		pstmt.setInt(2, grps + 1);
		pstmt.setInt(3, grpl + 1);

		pstmt.setString(4, subject);
		pstmt.setString(5, writer);
		pstmt.setString(6, mail);
		pstmt.setString(7, password);
		pstmt.setString(8, content);
		pstmt.setString(9, wip);

		int result = pstmt.executeUpdate();
		if (result == 1) {
			flag = 0;
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
		out.println(String.format("location.href='board_view1.jsp?cpage=%s&seq=%s';", cpage, seq));
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