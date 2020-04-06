<%@page import="model1.DeptTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>

<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String resource = "myBatisConfig.xml";

	InputStream is = null;
	SqlSession sqlSession = null;

	StringBuffer sbHtml = new StringBuffer();

	try {

		is = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = 
				new SqlSessionFactoryBuilder().build(is);
		System.out.println("설정이 호출됨");

		sqlSession = sqlSessionFactory.openSession();
		System.out.println("데이터베이스 연결");
		
		ArrayList<DeptTO> list = new ArrayList<>(sqlSession.selectList("selectList1"));
		
		sbHtml.append("<table width='600' border='1'>");
		for(DeptTO dto : list) {
			sbHtml.append("<tr>");
			sbHtml.append("<td>" + dto.getDeptno() + "</td>");
			sbHtml.append("<td>" + dto.getDname() + "</td>");
			sbHtml.append("<td>" + dto.getLoc() + "</td>");
			sbHtml.append("</tr>");
		}	
		sbHtml.append("</table>");
		

	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		if (sqlSession != null)
			sqlSession.close();
		if (is != null)
			try {
				is.close();
			} catch (IOException e) {
			}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= sbHtml %>
</body>
</html>