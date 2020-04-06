<%@page import="model1.EmpTO"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="org.apache.ibatis.io.Resources"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>

<%@ page import="config.SqlMapperInter"%>
<%@ page import="model1.DeptTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String resource = "myBatisConfig.xml";

	InputStream is = null;
	SqlSession sqlSession = null;

	StringBuffer sbHtml = new StringBuffer();
	try {
		is = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

		sqlSession = sqlSessionFactory.openSession(true);

		//추가된 코드
		sqlSession.getConfiguration().addMapper(SqlMapperInter.class);

		SqlMapperInter mapper = sqlSession.getMapper(SqlMapperInter.class);
		//---------------------//
				
		
		ArrayList<EmpTO> list = mapper.selectEmpList();
		
		sbHtml.append("<table width='600' border='1'");		
		for (EmpTO eTo : list) {
			sbHtml.append("<tr>");
			sbHtml.append("<td>" + eTo.getEmpno() + "</td>");
			sbHtml.append("<td>" + eTo.getEname() + "</td>");
			sbHtml.append("<td>" + eTo.getSal() + "</td>");
			sbHtml.append("</tr>");
		}
		sbHtml.append("</table>");
		

	} catch (IOException e) {
		// TODO Auto-generated catch block
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