<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ page import="modelPaging.CandlestickTO"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<%
	ArrayList<CandlestickTO> candlestickList = (ArrayList)request.getAttribute("CandlestickList");
	
	JSONObject result = new JSONObject();
	//result.put("isSuccess", "true");
	
	JSONArray jsonArray = new JSONArray();
	
	
	for(CandlestickTO cTo : candlestickList) {
		JSONObject obj = (JSONObject) new JSONParser().parse(cTo.getCandleJSON());		
		jsonArray.add(obj);
	}
	result.put("Data", jsonArray);
	
	
	ArrayList<CandlestickTO> lastPriceList = (ArrayList)request.getAttribute("LastPriceList");
	JSONArray jsonPriceArray = new JSONArray();
	for(CandlestickTO cTo : lastPriceList) {
		JSONObject obj = (JSONObject) new JSONParser().parse(cTo.getCandleJSON());
		
		String propName = cTo.getCandleKey().replaceAll("minute", "").replaceAll("[0-9]", "");
		
		obj.put("propName", propName);
		jsonPriceArray.add(obj);
	}
	result.put("LastPriceData", jsonPriceArray);
	
	
	out.println(result);
%>

