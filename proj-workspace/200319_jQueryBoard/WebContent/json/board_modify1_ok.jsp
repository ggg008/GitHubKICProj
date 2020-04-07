<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	JSONObject result = new JSONObject(), obj = new JSONObject();
	result.put("flag", (Integer)request.getAttribute("flag"));
	
	obj.put("seq", (String)request.getAttribute("seq"));
	result.put("data", obj);
	
	out.println(result);
%>
