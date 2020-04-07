<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	JSONObject result = new JSONObject(), obj = new JSONObject();
	result.put("flag", "0");
	
	obj.put("seq", (String)request.getAttribute("seq"));
	obj.put("subject", (String)request.getAttribute("subject"));
	obj.put("writer", (String)request.getAttribute("writer"));
	result.put("data", obj);
	
	out.println(result);
%>
