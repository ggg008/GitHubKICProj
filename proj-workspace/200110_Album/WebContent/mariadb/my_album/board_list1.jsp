<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="albumModel.AlbumBoardListTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="albumModel.AlbumBoardDAO"%>
<%@page import="albumModel.AlbumBoardTO"%>

<%
	//paging <- 10개씩 나눠서 한페이지를 이루게끔...
	request.setCharacterEncoding("utf-8");

	int cpage = 1;
	if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
		cpage = Integer.parseInt(request.getParameter("cpage"));
	}

	AlbumBoardListTO listTO = new AlbumBoardListTO();
	listTO.setCpage(cpage);

	AlbumBoardDAO dao = new AlbumBoardDAO();
	listTO = dao.boardList(listTO);

	int recordPerPage = listTO.getRecordPerPage();// 한페이지당 출력 데이터 갯수
	int totalRecord = listTO.getTotalRecord();//전체 데이터 갯수
	int totalPage = listTO.getTotalPage();
	int blockPerPage = listTO.getBlockPerPage();

	int startBlockPage = listTO.getStartBlock();
	int endBlockPage = listTO.getEndBlock();

	ArrayList<AlbumBoardTO> boardLists = listTO.getBoardLists();

	StringBuffer sbHtml = new StringBuffer();

	for (int i = 0; i < recordPerPage; ++i) {
		String seq = "";
		String subject = "";
		String writer = "";
		String wdate = "";
		String imgfilname = "";
		int wgap = 0;
		String hit = "";
		int commentNum = 0;

		AlbumBoardTO to = i < boardLists.size() ? boardLists.get(i) : null;
		if (to != null) {
			seq = to.getSeq();
			subject = to.getSubject();
			writer = to.getWriter();
			wdate = to.getWdate();
			imgfilname = to.getImgname();
			wgap = to.getWgap();
			hit = to.getHit();
			commentNum = to.getCommentNum();
		}
		

		if (i == 0) {
			sbHtml.append("<tr>");
		} else if (i % 5 == 0) {
			sbHtml.append("</tr><tr>");
		} else if (i == boardLists.size()) {
			sbHtml.append("</tr>");
		}
		

		if (seq.equals("")) {
			sbHtml.append("<td width='20%' class='last2'>           ");
			sbHtml.append("		<div class='board'>                 ");
			sbHtml.append("</div>");
			sbHtml.append("</td>");

			continue;
		}

		sbHtml.append("<td width='20%' class='last2'>           ");
		sbHtml.append("		<div class='board'>                 ");
		sbHtml.append("			<table class='boardT'>          ");
		sbHtml.append("			<tr>                            ");
		sbHtml.append("				<td class='boardThumbWrap'> ");
		sbHtml.append("					<div class='boardThumb'>");
		sbHtml.append("						<a href='board_view1.jsp?cpage=" + cpage + "&seq=" + seq
				+ "'><img src='../../upload/" + imgfilname + "' border='0' height='144px' /></a>");
		sbHtml.append("					</div>					");
		sbHtml.append("				</td>                       ");
		sbHtml.append("			</tr>                           ");
		sbHtml.append("			<tr>                            ");
		sbHtml.append("				<td>                        ");
		sbHtml.append("					<div class='boardItem'>	");
		sbHtml.append("						<strong>" + subject + "</strong>");
		if (0 < commentNum) {

			sbHtml.append("<span class='coment_number'><img src='../../images/icon_comment.png' alt='commnet'>"
					+ commentNum + "</span>");
		}
		if (wgap == 0) {
			sbHtml.append("<img src='../../images/icon_hot.gif' alt='HOT'>");
		}
		sbHtml.append("</div>                                             ");
		sbHtml.append("</td>                                                  ");
		sbHtml.append("	</tr>                                                      ");
		sbHtml.append("	<tr>                                                       ");
		sbHtml.append("<td><div class='boardItem'><span class='bold_blue'>" + writer + "</span></div></td>");
		sbHtml.append("	</tr>");
		sbHtml.append("	<tr>");
		sbHtml.append("<td><div class='boardItem'>" + wdate + " <font>|</font> Hit " + hit + "</div></td>");
		sbHtml.append("	</tr>");
		sbHtml.append("</table>");
		sbHtml.append("</div>");
		sbHtml.append("</td>");

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
<style type="text/css">
<!--
.board_pagetab {
	text-align: center;
}

.board_pagetab a {
	text-decoration: none;
	font: 12px verdana;
	color: #000;
	padding: 0 3px 0 3px;
}

.board_pagetab a:hover {
	text-decoration: underline;
	background-color: #f2f2f2;
}

.on a {
	font-weight: bold;
}
-->
</style>
</head>

<body>
	<!-- 상단 디자인 -->
	<div class="contents1">
		<div class="con_title">
			<p style="margin: 0px; text-align: right">
				<img style="vertical-align: middle" alt=""
					src="../../images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
			</p>
		</div>
		<div class="contents_sub">
			<div class="board_top">
				<div class="bold">
					<p>
						총 <span class="txt_orange"><%=totalRecord%></span>건
					</p>
				</div>
			</div>

			<!--게시판-->
			<table class="board_list">
				<!-- 
				<tr>
					<td width="20%" class="last2">
				</tr>
			 -->
				<%=sbHtml%>
			</table>
			<!--//게시판-->

			<div class="align_right">
				<button type="button" class="btn_write btn_txt01"
					style="cursor: pointer;"
					onclick="location.href='board_write1.jsp?cpage=<%=cpage%>'">쓰기</button>
			</div>
			<!--페이지넘버-->
			<div class="paginate_regular">
				<div class="board_pagetab">
					<%
						/*
						<span class='off'><a href='#'>&lt;&lt;</a>&nbsp;&nbsp;</span>
						<span class='off'><a href='#'>&lt;</a>&nbsp;&nbsp;</span>
						<span class='off'><a href='#'>[ 1 ]</a></span>
						<span class='on'><a href='#'>[ 2 ]</a></span>
						<span class='off'><a href='#'>[ 3 ]</a></span>
						<span class='off'>&nbsp;&nbsp;<a href='#'>&gt;</a></span>
						<span class='off'>&nbsp;&nbsp;<a href='#'>&gt;&gt;</a></span>				
						*/

						out.println("<span class='off'>");
						if (startBlockPage == 1) {
							out.println("<a href='#'>&lt;&lt;</a>");
						} else {
							out.println("<a href='board_list1.jsp?cpage=" + (startBlockPage - blockPerPage) + "'>&lt;&lt;</a>");
						}

						out.println("&nbsp;&nbsp;</span>");

						if (cpage == 1) {
							out.println("<span class='off'><a href='#'>&lt;</a>");
						} else {
							out.println("<span class='off'><a href='board_list1.jsp?cpage=" + (cpage - 1) + "'>&lt;</a>");
						}
						out.println("&nbsp;&nbsp;</span>");

						for (int i = startBlockPage; i <= endBlockPage; ++i) {
							if (cpage == i) {
								out.println("<span class='on'><a>[ " + i + " ]</a></span>");
							} else {
								out.println("<span class='off'><a href='board_list1.jsp?cpage=" + i + "'>[ " + i + " ]</a></span>");
							}
						}

						out.println("<span class='off'>&nbsp;&nbsp;");
						if (cpage == totalPage) {
							out.println("<a href='#'>&gt;</a>");
						} else {
							out.println("<a href='board_list1.jsp?cpage=" + (cpage + 1) + "'>&gt;</a>");
						}
						out.println("</span>&nbsp;<span class='off'>&nbsp;&nbsp;");

						if (endBlockPage == totalPage) {
							out.println("<a>&gt;&gt;</a>");
						} else {
							out.println("<a href='board_list1.jsp?cpage=" + (startBlockPage + blockPerPage) + "'>&gt;&gt;</a>");
						}

						out.println("</span>");
					%>
				</div>
			</div>
			<!--//페이지넘버-->
		</div>
	</div>
	<!--//하단 디자인 -->

</body>
</html>
