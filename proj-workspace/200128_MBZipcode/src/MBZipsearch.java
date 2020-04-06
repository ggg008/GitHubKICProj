import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MBZipsearch
{

	public static void main(String[] args)
	{
		Scanner scanner = new Scanner(System.in);
		
		String resource = "myBatisConfig.xml";

		InputStream is = null;
		SqlSession sqlSession = null;

		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

			sqlSession = sqlSessionFactory.openSession();


			System.out.println("찾으려는 동을 입력하세요.");
			
			String searchDong = scanner.nextLine();
			
			
			
			ArrayList<ZipcodeTO> list = new ArrayList<>(sqlSession.selectList("selectListZip", searchDong + "%"));
			
			System.out.println(list.size());
			
			for(int i = 0; list != null && i < list.size(); ++i) {
				ZipcodeTO zTo = list.get(i);
				
				System.out.printf("%s★%s★%s★%s★%s★%s★%s\n", zTo.getSeq(), zTo.getZipcode(), zTo.getSido(), zTo.getGugun(), zTo.getDong(), zTo.getRi(), zTo.getBunji());
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
