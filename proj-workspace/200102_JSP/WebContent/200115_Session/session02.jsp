<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//선행 파일을 먼저 실행해야 출력
//단독으로 실행하면 버퍼가 비어있기 때문에 출력이 안됨
//세션은 서버 버퍼에 저장됨(사용 최소화)

	out.println((String)session.getAttribute("data"));
%>
