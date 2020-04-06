package _200129;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import transferObjs.DeptTO;
import transferObjs.EmpTO;

public class MyBatisExDMLUpdate
{

	public static void main(String[] args)
	{
		// 바뀌지않는 기초 설정
		String resource = "myBatisConfig.xml";

		InputStream is = null;
		SqlSession sqlSession = null;

		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

			sqlSession = sqlSessionFactory.openSession(true);// treu집어넣으면 오토커밋
			// --바뀌지않는 기초 설정

			DeptTO dTo = new DeptTO();
			dTo.setDeptno("80");
			dTo.setDname("홍보");
			
			int result = sqlSession.update("update1", dTo);
			if( result == 0 ) {
				System.out.println("실패");
			} else {
				System.out.println("성공");
			}
				

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

	}

}
