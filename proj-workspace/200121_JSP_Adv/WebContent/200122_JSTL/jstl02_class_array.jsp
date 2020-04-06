<%@page import="java.util.HashMap"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 클래스, to 사용법 -->
<c:set var="to1" value="<%=new BoardTO()%>" />
<c:set target="${ to1 }" property="subject" value="제목" />
<c:set target="${ to1 }" property="writer" value="저자" />

<c:set var="to2" value="<%=new BoardTO()%>" />
<c:set target="${ to2 }" property="subject" value="제2목" />
<c:set target="${ to2 }" property="writer" value="저2자" />

${to1.subject} ${to1.writer}
<!-- / -->

<hr>

<!--  hashMap사용법 -->
<c:set var="hm" value="<%=new HashMap<>()%>" />
<c:set target="${ hm }" property="toKey1" value="${ to1 }" />
<c:set target="${ hm }" property="toKey2" value="${ to2 }" />

${hm.toKey1.subject} ${hm.toKey1.writer}
<br>
${hm.toKey2['subject']} ${hm.toKey2["writer"]}


<!--  /hashMap -->