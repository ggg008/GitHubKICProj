import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import config.SqlMapperInter;
import model1.DeptTO;

public class MyBatisEx01
{

	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
		
		String resource = "myBatisConfig.xml";
		
		InputStream is = null;
		SqlSession sqlSession = null;
		
		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
			
			sqlSession = sqlSessionFactory.openSession(true);

			//추가된 코드
			sqlSession.getConfiguration().addMapper(SqlMapperInter.class);
			
			SqlMapperInter mapper = sqlSession.getMapper(SqlMapperInter.class);
			
			ArrayList<DeptTO> list = mapper.selectList();
			
			for(DeptTO dTo : list) {
				System.out.println(dTo.getDeptno());
			}
			
//			DeptTO dTo = mapper.selectByDeptno("80");			
//			System.out.println(dTo.getDeptno());
//			System.out.println(dTo.getDname());
//			System.out.println(dTo.getLoc());
			
			DeptTO dTo = new DeptTO();
			dTo.setDeptno("80");
			dTo.setDname("연구");
			dTo.setLoc("대구");
			
			int result = mapper.insert(dTo);
			
			System.out.println("결과 : " + result);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(sqlSession != null)
				sqlSession.close();
			if( is != null)
				try {
					is.close();
				} catch (IOException e) {
				}
		}
		
	}

}
