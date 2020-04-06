package _200128;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import transferObjs.DeptTO;

public class MyBatisExList
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

			ArrayList<DeptTO> list = new ArrayList<>(sqlSession.selectList("selectList1"));
			
			System.out.println(list.size());
			
			for(int i = 0; list != null && i < list.size(); ++i) {
				DeptTO dTo = list.get(i);
				
				System.out.println("deptno : " + dTo.getDeptno());
				System.out.println("dname : " + dTo.getDname());
				System.out.println("loc : " + dTo.getLoc());
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
