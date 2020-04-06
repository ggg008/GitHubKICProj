<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//loginCheck.jsp

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//암호
	String save_id = "test";
	String save_password = "123";
	
	//검사
	
	int flag = 1;
	if(id.equals(save_id) && password.equals(save_password) ) {
		session.setAttribute("sess_id", id);
		session.setAttribute("sess_grade", "A");
		flag = 0;
	}
	
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('로그인 되었습니다')");
		out.println("location.href='loginComplete.jsp'");
	} else {
		out.println("alert('아이디나 비밀번호가 틀립니다');");
		out.println("history.back();");
	}
	out.println("</script>");

%>