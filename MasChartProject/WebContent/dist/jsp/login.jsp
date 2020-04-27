<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");

	int flag = (Integer)request.getAttribute("flag");
	

    String id = request.getParameter("idinput");
    
    out.println("<script type='text/javascript'>");
    if(flag == 1) {
          session.setAttribute("sess_id", id);
          out.println("alert('로그인 되었습니다.');");
          out.println("location.href='index.do';");
    } else if(flag == 0){
          out.println("alert('아이디 혹은 비밀번호를 입력해주세요.');");
          out.println("history.back()");
    } else if(flag == 2) {
      out.println("alert('아이디 혹은 비밀번호가 다릅니다.');");
        out.println("history.back()");
    }
    out.println("</script>");
    
    
%>