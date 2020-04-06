<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="modelPaging.BoardTO"%>
<%@ page import="modelPaging.BoardDAO"%>
<%@ page import="modelPaging.BoardListTO"%>
<%@ page import="java.util.ArrayList"%>

<%
	//paging <- 10개씩 나눠서 한페이지를 이루게끔...
	request.setCharacterEncoding("utf-8");

	int cpage = 1;
	if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
		cpage = Integer.parseInt(request.getParameter("cpage"));
	}

	BoardListTO listTO = new BoardListTO();
	listTO.setCpage(cpage);

	BoardDAO dao = new BoardDAO();
	listTO = dao.boardList(listTO);

	int recordPerPage = listTO.getRecordPerPage();// 한페이지당 출력 데이터 갯수
	int totalRecord = listTO.getTotalRecord();//전체 데이터 갯수
	int totalPage = listTO.getTotalPage();
	int blockPerPage = listTO.getBlockPerPage();

	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();

	ArrayList<BoardTO> boardLists = listTO.getBoardLists();

	StringBuffer sb = new StringBuffer();

	for (BoardTO to : boardLists) {
		String seq = to.getSeq();
		String subject = to.getSubject();
		String writer = to.getWriter();
		String wdate = to.getWdate();
		int wgap = to.getWgap();
		boolean existFile = (to.getFilename() != null);
		
		String hit = to.getHit();

		sb.append("<tr>");
		sb.append("	<td>&nbsp;</td>");
		sb.append("	<td>" + seq + "</td>");
		sb.append("	<td class='left'>");
		sb.append("		<a href='board_view1.jsp?cpage=" + cpage + "&seq=" + seq + "'>" + subject + "</a>");
		if (wgap == 0) {
			sb.append("		&nbsp;<img src='../../images/icon_hot.gif' alt='HOT'>");
		}
		sb.append("	</td>");
		sb.append("	<td>" + writer + "</td>");
		sb.append("	<td>" + wdate + "</td>");
		sb.append("	<td>" + hit + "</td>");
		sb.append("	<td>");
		if (existFile) {
			sb.append("<img src='../../images/icon_file.gif' />");
		}
		sb.append("	</td>");
		sb.append("</tr>");
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
				<td class="left"><a href="board_view1.jsp">adfas</a>&nbsp;<img src="../../images/icon_hot.gif" alt="HOT"></td>
				<td>asdfa</td>
				<td>2017.01.31 09:57</td>
				<td>6</td>
				<td><img src="../../images/icon_file.gif" /></td>
			</tr>
			 -->
				</table>
			</div>
			<!--//게시판-->

			<div class="align_right">
				<button type="button" class="btn_write btn_txt01"
					style="cursor: pointer;" onclick="location.href='board_write1.jsp?cpage=<%=cpage%>'">쓰기</button>
			</div>

			<!--페이지넘버-->
			<div class="paginate_regular">
				<div align="absmiddle">
					<%
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
