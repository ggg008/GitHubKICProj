<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("idinput");
	String password = request.getParameter("pwinput");
	
	int flag = 1;
	if((id.equals("tester") && password.equals("1234")) || (id.equals("pepe") && password.equals("1234")) ) {
		session.setAttribute("sess_id", id);
		flag = 0;
	}
	
    out.println("<script type='text/javascript'>");
    if(flag == 0) {
          //out.println("alert('로그인 되었습니다.');");
          out.println("location.href='../../index.html';");
    } else {
          out.println("alert('아이디나 비밀번호가 틀립니다.');");
          out.println("history.back()");
    }
    out.println("</script>");
    
%>