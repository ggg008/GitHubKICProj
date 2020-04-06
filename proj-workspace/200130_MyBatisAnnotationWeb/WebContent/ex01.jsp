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
		//

		ArrayList<DeptTO> list = mapper.selectList();

		
		sbHtml.append("<table width='600' border='1'");		
		for (DeptTO dTo : list) {
			sbHtml.append("<tr>");
			sbHtml.append("<td>" + dTo.getDeptno() + "</td>");
			sbHtml.append("<td>" + dTo.getDname() + "</td>");
			sbHtml.append("<td>" + dTo.getLoc() + "</td>");
			sbHtml.append("</tr>");
		}
		sbHtml.append("</table>");

		//			DeptTO dTo = mapper.selectByDeptno("80");			
		//			System.out.println(dTo.getDeptno());
		//			System.out.println(dTo.getDname());
		//			System.out.println(dTo.getLoc());

		/* DeptTO dTo = new DeptTO();
		dTo.setDeptno("80");
		dTo.setDname("연구");
		dTo.setLoc("대구");

		int result = mapper.insert(dTo);

		System.out.println("결과 : " + result); */

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