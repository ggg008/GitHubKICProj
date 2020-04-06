<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	StringBuffer sb = new StringBuffer();
	sb.append("<books>");
	sb.append("<book>");
	sb.append("	<name>모던 웹 디자인을 위한 HTML5 + CSS3 입문</name>");
	sb.append("	<publisher>한빛미디어</publisher>");
	sb.append("	<author>윤인성</author>");
	sb.append("	<price>30000원</price>");
	sb.append("</book>");
	sb.append("<book>");
	sb.append("	<name>모던 웹을 위한 JavaScript + jQuery 입문</name>");
	sb.append("	<publisher>한빛미디어</publisher>");
	sb.append("	<author>윤인성</author>");
	sb.append("	<price>32000원</price>");
	sb.append("</book>");
	sb.append("<book>");
	sb.append("	<name>모던 웹을 위한 node.js 프로그래밍</name>");
	sb.append("	<publisher>한빛미디어</publisher>");
	sb.append("	<author>윤인성</author>");
	sb.append("	<price>22000원</price>");
	sb.append("</book>");
	sb.append("<book>");
	sb.append("	<name>모던 웹을 위한 HTML5 프로그래밍</name>");
	sb.append("	<publisher>한빛미디어</publisher>");
	sb.append("	<author>윤인성</author>");
	sb.append("	<price>30000원</price>");
	sb.append("</book>");
	sb.append("</books>");
	out.println(sb);
%>