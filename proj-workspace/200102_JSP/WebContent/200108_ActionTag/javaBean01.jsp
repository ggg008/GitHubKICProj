<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- <%@page import="pack.MemberTo"%> --%>
 
<jsp:useBean id="to" class="pack.MemberTo"/>

<jsp:setProperty name="to" property="id" value="tester"/>
<jsp:setProperty name="to" property="password" value="123"/>

<!-- out.println + getXXX() -->
<jsp:getProperty name="to" property="id"/> <br>
<jsp:getProperty name="to" property="password"/> <br>

<%
	//메모리상에서 이 페이지를 출력하기 전까지만 유효
	//MemberTo to = new MemberTo();
	//to.setId("tester");
	//to.setPassword("123");
	
	//out.println( to.getId() + "<br>");
	//out.println( to.getPassword() + "<br>");
%>
