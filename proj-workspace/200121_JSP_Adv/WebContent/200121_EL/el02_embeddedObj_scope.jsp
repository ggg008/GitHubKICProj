<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("name1", "박문수");
	String name1 = "홍길동";
	boolean isLogin = false;
	
	//el : 내장객체에 넣어야 출력가능	
	request.setAttribute("name2", "홍길동");
	session.setAttribute("name3", "성춘향");
	application.setAttribute("name4", "이몽룡");
	

	//pageContext.setAttribute("name", "박문수");
	//request.setAttribute("name", "홍길동");
	//session.setAttribute("name", "성춘향");
	//application.setAttribute("name", "이몽룡");
	
%>
이름 :
<%=name1%>
<br>
EL : ${ name1 }
<br>
ELScope : ${ pageScope.name1 }
<br>
EL : ${ name2 }
<br>
ELScope : ${ requestScope.name2 }<!-- 내장 객체 선택 -->
<br>
EL : ${ name3 }
<br>
EL : ${ name4 }
<br>


EL : ${ name } 
<!-- 중복시 가장 상위 내장객체 값이 출력 -->
<!-- null이 없음 -->
<br>