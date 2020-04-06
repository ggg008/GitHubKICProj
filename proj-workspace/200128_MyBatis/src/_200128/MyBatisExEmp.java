package _200128;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import transferObjs.EmpTO;

public class MyBatisExEmp
{

	public static void main(String[] args)
	{
		String resource = "myBatisConfig.xml";

		InputStream is = null;
		SqlSession sqlSession = null;

		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

			sqlSession = sqlSessionFactory.openSession();

			ArrayList<EmpTO> list = new ArrayList<>(sqlSession.selectList("selectListEmpS", "s%"));
			
			System.out.println(list.size());
			
			for(int i = 0; list != null && i < list.size(); ++i) {
				EmpTO eTo = list.get(i);
				
				System.out.println("Empno : " + eTo.getEmpno());
				System.out.println("Ename : " + eTo.getEname());
				System.out.println("Sal : " + eTo.getSal());
				
//				System.out.println("Empno : " + eTo.getDeptno());
//				System.out.println("Ename : " + eTo.getDname());
//				System.out.println("Sal : " + eTo.getLoc());
				
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
