<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%
	String seq = (String)request.getAttribute("seq");
	int flag = (Integer)request.getAttribute("flag");	

	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='./view.mysql?seq=" + seq + "'");
	} else if(flag == 1) {
		out.println("alert('비밀번호 틀립니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('글수정에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>
