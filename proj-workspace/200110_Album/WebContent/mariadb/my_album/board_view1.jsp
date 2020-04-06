<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="albumModel.AlbumBoardDAO"%>
<%@page import="albumModel.AlbumBoardTO"%>
<%@page import="albumModel.AlbumCommentTO"%>
<%@page import="albumModel.AlbumCommentDAO"%>
<%@page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");

	String cpage = request.getParameter("cpage");
	String seq = request.getParameter("seq");

	AlbumBoardTO to = new AlbumBoardTO();
	to.setSeq(seq);

	AlbumBoardDAO dao = new AlbumBoardDAO();
	to = dao.boardView(to);

	String subject = to.getSubject();
	String writer = to.getWriter();
	String mail = to.getMail();
	String wip = to.getWip();
	String wdate = to.getWdate();
	String hit = to.getHit();
	String content = to.getContent();

	String filename = to.getImgname() == null ? "" : to.getImgname();
	String filesize = to.getImgsize();

	ArrayList<AlbumCommentTO> commentList = new ArrayList<AlbumCommentTO>();
	AlbumCommentDAO cdao = new AlbumCommentDAO();
	commentList = cdao.commentList(commentList, seq);

	StringBuffer sbCommentHtml = new StringBuffer();

	for (int i = 0; i < commentList.size(); ++i) {
		//for (AlbumCommentTO cto : commentList) {
		AlbumCommentTO cto = commentList.get(i);

		String commentno = cto.getCommentno();
		String cwriter = cto.getWriter();
		String cwdate = cto.getWdate();
		String ccontent = cto.getContent();

		sbCommentHtml.append("<form action='comment_delete_ok.jsp' method='post' name='ccfrm' ");
		//sbCommentHtml.append("onsubmit='delcfrmsubmit(this)'");
		sbCommentHtml.append(">");

		sbCommentHtml.append("<input type='hidden' name='seq' value=" + seq + ">");
		sbCommentHtml.append("<input type='hidden' name='cpage' value=" + cpage + ">");
		sbCommentHtml.append("<input type='hidden' name='commentno' value=" + commentno + ">");
		sbCommentHtml.append("<table>");
		sbCommentHtml.append("<tr>");
		sbCommentHtml.append("<td class='coment_re'><strong>" + cwriter + "</strong>");
		sbCommentHtml.append(" (" + cwdate + ")");
		sbCommentHtml.append("<div class='coment_re_txt'>" + ccontent + "</div>");
		sbCommentHtml.append("</td>");
		sbCommentHtml.append("<td class='coment_re' width='12%' align='right'>");
		sbCommentHtml.append("<input type='password' name='comment_del_password' value='' class='coment_input pR10'/>");
		sbCommentHtml.append("<input type='image' src='../../images/icon_del.gif' id='button" + i
				+ "'  style='vertical-align: middle'/>");
		//sbCommentHtml.append("<input type='button' value='test' id='button"+ i +"' />");

		sbCommentHtml.append("</td>");
		sbCommentHtml.append("</tr>");
		sbCommentHtml.append("</table>");
		sbCommentHtml.append("</form>");
		
		//System.out.println();
		//System.out.println("코멘트추가!");

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
<link rel="stylesheet" type="text/css" href="../../css/board_view.css">

<script type="text/javascript">
	window.onload = function() {

/* 
		var ccfrms = document.getElementsByName('ccfrm');

		if (ccfrms != null && typeof ccfrms != 'undefined') {
		 
			console.log('ccfrms');
			console.log(document.ccfrm);
			console.log(document.ccfrm.length);
			console.log(ccfrms[0]);
			console.log(ccfrms[0].comment_del_password);
			//console.log(ccfrms[0].comment_del_password.value);
			console.log(ccfrms);
		}
		 */

		var jsCommentList = new Array();
		for (var i = 0; i < <%= commentList.size() %>; ++i) {
			var id = 'button' + i;
			var commentObj = new CommentBtnObj(id, i);

			var btnObj = document.getElementById(commentObj.btnId);

			btnObj.onclick = commentObj.fuc;
			jsCommentList.push(commentObj);
			//console.log(btnObj);
		}
		//console.log(commentList);

	};

	function CommentBtnObj(btnId, idx) {
		this.btnId = btnId;
		this.idx = idx;
		this.fuc = function() {
			//console.log(btnId + " : " + idx);
			var selComment = document.ccfrm[idx];
			var password = selComment.comment_del_password.value;

			//alert(selComment.commentno.value + " : " + password);
			if (password.trim() == '') {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;
			}

		};
	};

	function cfrmsubmit() {
		//alert('test');
		//필수 입력 요소 검사
		if (document.cfrm.cwriter.value.trim() == '') {
			alert('이름을 입력하셔야 합니다.');
			return false;
		}
		if (document.cfrm.cpassword.value.trim() == '') {
			alert('비밀번호를 입력하셔야 합니다.');
			return false;
		}
		if (document.cfrm.ccontent.value.trim() == '') {
			alert('내용을 입력하셔야 합니다.');
			return false;
		}

		return true;
	};
</script>


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
			<!--게시판-->
			<div class="board_view">
				<table>
					<tr>
						<th width="10%">제목</th>
						<td width="60%"><%=subject%></td>
						<th width="10%">등록일</th>
						<td width="20%"><%=wdate%></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><%=writer%></td>
						<th>조회</th>
						<td><%=hit%></td>
					</tr>
					<tr>
						<td colspan="4" height="200" valign="top"
							style="padding: 20px; line-height: 160%">
							<div id="bbs_file_wrap">
								<div>
									<img src="../../upload/<%=filename%>" width="500" onerror="" /><br />
								</div>
							</div> <%=content%>
						</td>
					</tr>
				</table>

				<!-- 
				<table>
					<tr>
						<td class="coment_re" width="20%"><strong>54545</strong>
							(2016.09.19 02:00)
							<div class="coment_re_txt">Test</div></td>
					</tr>
					<tr>
						<td class="coment_re" width="20%"><strong>하오리</strong>
							(2016.09.19 07:54)
							<div class="coment_re_txt">우리는 민족 중흥의 역사적 사명을 띄고 이 땅에 태어났다.
								조상의 빛난 얼을 오늘에 되살려</div></td>
					</tr>
				</table>
					 -->
				<%=sbCommentHtml%>

				<form action="comment_write_ok.jsp" method="post" name="cfrm"
					onsubmit="return cfrmsubmit()">
					<input type="hidden" name="seq" value="<%=seq%>"> <input
						type="hidden" name="cpage" value="<%=cpage%>">
					<table>
						<tr>
							<td width="94%" class="coment_re">글쓴이 <input type="text"
								name="cwriter" maxlength="5" class="coment_input" />&nbsp;&nbsp;
								비밀번호 <input type="password" name="cpassword"
								class="coment_input pR10" />&nbsp;&nbsp;
							</td>
							<td width="6%" class="bg01"></td>
						</tr>
						<tr>
							<td class="bg01"><textarea name="ccontent" cols="" rows=""
									class="coment_input_text"></textarea></td>
							<td align="right" class="bg01">
								<button type="submit" class="btn_re btn_txt01">댓글등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="btn_area">
				<div class="align_left">
					<button type="button" class="btn_list btn_txt02"
						style="cursor: pointer;"
						onclick="location.href='board_list1.jsp?cpage=<%=cpage%>'">목록</button>
				</div>
				<div class="align_right">
					<button type="button" class="btn_list btn_txt02"
						style="cursor: pointer;"
						onclick="location.href='board_modify1.jsp?cpage=<%=cpage%>&seq=<%=seq%>'">수정</button>
					<button type="button" class="btn_list btn_txt02"
						style="cursor: pointer;"
						onclick="location.href='board_delete1.jsp?cpage=<%=cpage%>&seq=<%=seq%>'">삭제</button>
					<button type="button" class="btn_write btn_txt01"
						style="cursor: pointer;"
						onclick="location.href='board_write1.jsp?cpage=<%=cpage%>&seq=<%=seq%>'">쓰기</button>
				</div>
			</div>
			<!--//게시판-->
		</div>
		<!-- 하단 디자인 -->
	</div>

</body>
</html>
