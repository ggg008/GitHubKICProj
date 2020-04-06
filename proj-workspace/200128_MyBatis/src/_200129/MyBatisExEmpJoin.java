package _200129;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import transferObjs.EmpTO;

public class MyBatisExEmpJoin
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

			ArrayList<EmpTO> list = new ArrayList<>(sqlSession.selectList("selectListJoin"));
			
			System.out.println(list.size());
			
			for(int i = 0; list != null && i < list.size(); ++i) {
				EmpTO eTo = list.get(i);
				
				System.out.printf("%s %s %s %s %s \n", 
						eTo.getEmpno(), eTo.getEmpno(), eTo.getEname(), eTo.getSal(), eTo.getDeptno(), eTo.getSalGrade());				
				
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
