<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");


	out.println("시작 <hr>");
	String data = "value";
	//액션태그

	request.setAttribute("data2", "value2");
	out.println("data3 : " + request.getParameter("data3") + "<br>");
%>
<jsp:include page="sub.jsp">
	<jsp:param value="<%=data%>" name="data" />
</jsp:include>
<%
	out.println("<hr>끝");
%>