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
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
	//paging <- 10개씩 나눠서 한페이지를 이루게끔...
	request.setCharacterEncoding("utf-8");

	int cpage = 1;
	if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
		cpage = Integer.parseInt(request.getParameter("cpage"));
	}

	int recordPerPage = 10;// 한페이지당 출력 데이터 갯수
	int totalRecord = 0;//전체 데이터 갯수
	int totalPage = 1;

	int blockPerPage = 5;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	StringBuffer sb = new StringBuffer();

	try {
		Context initCtx = new InitialContext();//톰캣 환경설정에 접근
		Context envCtx = (Context) initCtx.lookup("java:comp/env");//커넥션 풀링 접근(context 이용하여)
		DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");

		conn = dataSource.getConnection();//풀링에서 커넥션 가져옴

		String sql = "SELECT seq, grpl, subject, writer, date_format(wdate, '%Y-%m-%d') fdate, datediff(now(), wdate) wgap, hit FROM rep_board1 ORDER BY grp DESC, grps ASC"; //evernote w6
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);//갯수를 가져오는 옵션

		rs = pstmt.executeQuery();

		rs.last();
		totalRecord = rs.getRow();
		rs.beforeFirst();

		totalPage = ((totalRecord - 1) / recordPerPage) + 1;

		int skip = (cpage - 1) * recordPerPage;
		if (skip != 0) {
			rs.absolute(skip);
		}

		for (int i = 0; i < recordPerPage && rs.next(); ++i) {
			String seq = rs.getString("seq");
			
			int grpl = rs.getInt("grpl");
			String sgrpl = "";
			for(int j = 0; j <grpl; ++j) {
				sgrpl += "&nbsp;&nbsp;";
			}
			
			String subject = rs.getString("subject");
			String writer = rs.getString("writer");
			String wdate = rs.getString("fdate");//.substring(0, rs.getString("wdate").length() - 10);
			int wgap = rs.getInt("wgap");
			String hit = rs.getString("hit");

			sb.append("<tr>");
			sb.append("	<td>&nbsp;</td>");
			sb.append("	<td>" + seq + "</td>");
			sb.append("	<td class='left'>");
			
			if(grpl != 0) {
				sb.append(sgrpl + "<img src='../../images/re.gif' width='9'/>");
			}
			
			sb.append("		<a href='board_view1.jsp?cpage="+ cpage +"&seq=" + seq + "'>" + subject + "</a>");
			if (wgap == 0) {
				sb.append("&nbsp;<img src='../../images/icon_hot.gif' alt='HOT'>");
			}
			sb.append("	</td>");
			sb.append("	<td>" + writer + "</td>");
			sb.append("	<td>" + wdate + "</td>");
			sb.append("	<td>" + hit + "</td>");
			sb.append("	<td>&nbsp;</td>");
			sb.append("</tr>");

		}

	} catch (NamingException e) {
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
			<!--//게시판-->

			<div class="align_right">
				<button type="button" class="btn_write btn_txt01"
					style="cursor: pointer;"
					onclick="location.href='board_write1.jsp?cpage=<%=cpage%>'">쓰기</button>
			</div>
			<!--페이지넘버-->
			<div class="paginate_regular">
				<div align="absmiddle">
					<%
						int startBlock = ((cpage - 1) / blockPerPage) * blockPerPage + 1;
						int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
						if (endBlock >= totalPage) {
							endBlock = totalPage;
						}

						if (startBlock == 1) {
							out.println("<span><a>&lt;&lt;</a></span>");
						} else {
							out.println("<span><a href='board_list1.jsp?cpage=" + (startBlock - blockPerPage)
									+ "'>&lt;&lt;</a></span>");
						}

						out.println("&nbsp;");

						if (cpage == 1) {
							out.println("<span><a>&lt;</a></span>");
						} else {
							out.println("<span><a href='board_list1.jsp?cpage=" + (cpage - 1) + "'>&lt;</a></span>");
						}
						out.println("&nbsp;&nbsp;");

						for (int i = startBlock; i <= endBlock; ++i) {
							if (cpage == i) {
								out.println("<span><a><font color='red'>[" + i + "]</font></a></span>");
							} else {
								out.println("<span><a href='board_list1.jsp?cpage=" + i + "'>" + i + "</a></span>");
							}
						}

						out.println("&nbsp;&nbsp;");
						if (cpage == totalPage) {
							out.println("<span><a>&gt;</a></span>");
						} else {
							out.println("<span><a href='board_list1.jsp?cpage=" + (cpage + 1) + "'>&gt;</a></span>");
						}

						out.println("&nbsp;");

						if (endBlock == totalPage) {
							out.println("<span><a>&gt;&gt;</a></span>");
						} else {
							out.println("<span><a href='board_list1.jsp?cpage=" + (startBlock + blockPerPage)
									+ "'>&gt;&gt;</a></span>");
						}
					%>
				</div>
			</div>
			<!--//페이지넘버-->
		</div>
	</div>
	<!--//하단 디자인 -->

</body>
</html>
