<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ page import="modelPaging.CandlestickTO"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<%
	ArrayList<CandlestickTO> candlestickList = (ArrayList)request.getAttribute("CandlestickLsit");
	
	JSONObject result = new JSONObject();
	//result.put("isSuccess", "true");
	
	JSONArray jsonArray = new JSONArray();
	
	
	for(CandlestickTO cTo : candlestickList) {
		JSONObject obj = (JSONObject) new JSONParser().parse(cTo.getCandleJSON());		
		jsonArray.add(obj);
	}
	result.put("Data", jsonArray);
	
	out.println(result);
%>

