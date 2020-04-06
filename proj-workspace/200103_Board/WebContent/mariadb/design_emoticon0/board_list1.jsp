<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
	request.setCharacterEncoding("utf-8");

	String url = "jdbc:mysql://localhost:3306/project";
	String user = "project";
	String pass = "123456";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	StringBuffer sb = new StringBuffer();

	int totalRecord = 0;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);

		String sql = "SELECT seq, subject, writer, date_format(wdate, '%Y-%m-%d') fdate, datediff(now(), wdate) wgap, hit, emot FROM emot_board1 order by seq desc"; //evernote w6
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);//갯수를 가져오는 옵션

		rs = pstmt.executeQuery();

		rs.last();
		totalRecord = rs.getRow();
		rs.beforeFirst();

		while (rs.next()) {
			String seq = rs.getString("seq");
			String subject = rs.getString("subject");
			String writer = rs.getString("writer");
			String wdate = rs.getString("fdate");//.substring(0, rs.getString("wdate").length() - 10);
			int wgap = rs.getInt("wgap");
			String hit = rs.getString("hit");
			String emot = rs.getString("emot");

			sb.append("<tr>");
			sb.append("	<td>&nbsp;</td>");
			sb.append("	<td>" + seq + "</td>");
			sb.append("	<td width='60%' class='left'>");
			sb.append("	(<img valign='top' src='../../images/emoticon/"+ emot +".png' width='10'/>)");
			sb.append("		<a href='board_view1.jsp?seq=" + seq + "'>" + subject + "</a>");
			if(wgap == 0) {
				sb.append("		&nbsp;<img src='../../images/icon_hot.gif' alt='HOT'>");
			}
			sb.append("	</td>");
			sb.append("	<td>" + writer + "</td>");
			sb.append("	<td>" + wdate + "</td>");
			sb.append("	<td>" + hit + "</td>");
			sb.append("	<td>&nbsp;</td>");
			sb.append("</tr>");			

		}

	} catch (ClassNotFoundException e) {
		System.out.println(e.getClass().getName() + " : " + e.getMessage());
	} catch (SQLException e) {
		System.out.println(e.getClass().getName() + " : " + e.getMessage());
	} finally {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board_list.css">
</head>

<body>
	<!-- 상단 디자인 -->
	<div class="con_title">
		<h3>게시판</h3>
		<p>
			HOME &gt; 게시판 &gt; <strong>게시판</strong>
		</p>
	</div>
	<div class="con_txt">
		<div class="contents_sub">
			<div class="board_top">
				<div class="bold">
					총 <span class="txt_orange"><%=totalRecord%></span>건
				</div>
			</div>

			<!--게시판-->
			<div class="board">
				<table>
					<tr>
						<th width="3%">&nbsp;</th>
						<th width="5%">번호</th>
						<th>제목</th>
						<th width="10%">글쓴이</th>
						<th width="17%">등록일</th>
						<th width="5%">조회</th>
						<th width="3%">&nbsp;</th>
					</tr>
					<%=sb%>
					<!-- 
					<tr>
						<td>&nbsp;</td>
						<td>1</td>
						<td class="left"><a href="board_view1.jsp">adfas</a>&nbsp;<img
							src="../../images/icon_hot.gif" alt="HOT"></td>
						<td>asdfa</td>
						<td>2017-01-31</td>
						<td>6</td>
						<td>&nbsp;</td>
					</tr>
					 -->
				</table>
			</div>
			<div class="align_right">
				<button type="button" class="btn_write btn_txt01"
					style="cursor: pointer;" onclick="location.href='board_write1.jsp'">쓰기</button>
			</div>
			<!--//게시판-->
		</div>
	</div>
	<!--//하단 디자인 -->

</body>
</html>
