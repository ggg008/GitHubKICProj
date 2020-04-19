<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("signupId");
	String email = request.getParameter("signupEmail");
	String password = request.getParameter("signupPassword");
	String cpassword = request.getParameter("signupCpassword");
	
	int flag = 1;
	
	out.println("<script type='text/javascript'>");
	
	if(!password.equals(cpassword)) {
		out.println("alert('비밀번호 확인이 올바르지 않습니다.');");
        out.println("history.back()");
	} else if(password.length() < 6) {
		out.println("alert('비밀번호를 6자리 이상 입력하셔야 합니다.');");
        out.println("history.back()");
	} else {
		flag = 0;
	}
	
	if(flag == 0) {
        out.println("location.href='./signup_ok.jsp';");
	}
	
	out.println("</script>");
%>