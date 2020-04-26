<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

    JSONObject result = new JSONObject();
	result.put("flag", 0);	
	
	out.println(result);

%>