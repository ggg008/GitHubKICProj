<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//System.out.println("3");
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	
	if(flag == 1) {
		// 실패
		out.println("alert('아이디가 중복되었습니다.')");
		out.println("history.back();");
	} else if(flag == 2) {
		// 성공
		out.println("alert('회원가입이 완료되었습니다.');");
        out.println("location.href='authentication-login.do';");
	} else if(flag == 3) {
		// 비밀번호 확인 틀림
		out.println("alert('비밀번호가 맞는지 확인해주세요.')");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>