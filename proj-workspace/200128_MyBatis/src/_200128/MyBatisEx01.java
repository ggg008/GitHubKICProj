package _200128;


import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import transferObjs.DeptTO;

public class MyBatisEx01
{

	public static void main(String[] args)
	{
		// TODO Auto-generated method stub

		// myBatisConfig.xml 읽어 접속
		String resource = "myBatisConfig.xml";
		InputStream is = null;
		SqlSession sqlSession = null;

		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is); // jsp 세션과 동일
			System.out.println("설정이 호출됨");

			sqlSession = sqlSessionFactory.openSession();
			System.out.println("데이터베이스 연결");

//			DeptTO dTo = (DeptTO) sqlSession.selectOne("select1"); // 저장된 sql실행하여 데이터하나 가져옴
//			DeptTO dTo = (DeptTO) sqlSession.selectOne("select2", "20"); // 저장된 sql실행하여 데이터하나 가져옴
			
			DeptTO pTo = new DeptTO();
			pTo.setDeptno("10");
			pTo.setDname("ACCOUNTING");
			DeptTO dTo = (DeptTO) sqlSession.selectOne("select3", pTo);
			
//			HashMap<String, Object> map = sqlSession.selectOne("select4", "10");			

			if (dTo != null) {
				System.out.println("deptno : " + dTo.getDeptno());
				System.out.println("dname : " + dTo.getDname());
				System.out.println("loc : " + dTo.getLoc());
				
				//map -> 컬럼명, 값
//				System.out.println("hashMap : " +  map.size());
//				Set<String> keys = map.keySet();
//				for(String key : keys) {
//					System.out.println(key + " : " + map.get(key));
//				}
				
				
			} else {
				System.out.println("데이터가 없습니다.");
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
