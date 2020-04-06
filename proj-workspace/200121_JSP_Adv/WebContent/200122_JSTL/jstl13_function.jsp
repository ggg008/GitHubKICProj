<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="str1" value="   Hello JSTL, Hello JSTL   "/>
${ fn:length( str1 ) } <br> 
${ fn:toUpperCase( str1 ) } <br>
${ fn:substring( str1, 3, 7 ) } <br>
${ fn:trim( str1 ) } <br>
${ fn:replace( str1, " ", "★" ) } <br>
${ fn:indexOf( str1, "JS") } <br>
${ fn:startsWith( str1, " ") } <br>
${ fn:endsWith( str1, " ") } <br>

<c:set var="tokens" value="1,2,3,4,5"/>
<c:set var="intArr" value="${ fn:split(tokens, ',') }"/>
${ fn:join(intArr, "-") } <br>

<c:set var="strXML" value="<html><head></head></body>"/>
${ fn:escapeXml( strXML ) } <br> <!-- html태그 소스 그대로 출력 -->

</body>
</html>