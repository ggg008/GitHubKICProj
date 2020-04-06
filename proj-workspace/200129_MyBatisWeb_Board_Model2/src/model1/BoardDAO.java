package model1;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO
{	
	private SqlSession sqlSession = null;
	
	public BoardDAO()
	{
		String resource = "myBatisConfig.xml";

		InputStream is = null;

		try {
			is = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

			this.sqlSession = sqlSessionFactory.openSession(true);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (is != null)
				try {
					is.close();
				} catch (IOException e) {
				}
		}
	}
	

	// board_write1.jsp
	public void boardWrite()
	{
		// 사용하지 않음
	}

	// board_write1_ok.jsp
	public int boardWriteOk(BoardTO to)
	{
		int flag = 1;
		
		int result = sqlSession.insert("boardWriteOk", to);
		if (result == 1) {
			flag = 0;
		}
		return flag;
	}

	public ArrayList<BoardTO> boardList()
	{		
		ArrayList<BoardTO> list = new ArrayList<>(sqlSession.selectList("boardList"));
		
		if(sqlSession != null)
			sqlSession.close();
		
		return list;
	}

	public BoardTO boardView(BoardTO to)
	{
		sqlSession.update("boardViewHit", to.getSeq());

		to = (BoardTO) sqlSession.selectOne("boardView", to);


		if(sqlSession != null)
			sqlSession.close();
		
		return to;
	}

	public BoardTO boardModify(BoardTO to)
	{		
		to = sqlSession.selectOne("boardModify", to.getSeq());

		if(sqlSession != null)
			sqlSession.close();
		
		return to;
	}

	public int boardModifyOk(BoardTO to)
	{	
		int flag = 1;
		
		int result = sqlSession.update("boardModifyOk", to);
		if (result == 1) {
			flag = 0;
		}
		return flag;
	}

	public BoardTO boardDelete(BoardTO to)
	{	
		to = sqlSession.selectOne("boardDelete", to.getSeq());

		if(sqlSession != null)
			sqlSession.close();
		
		return to;
	}

	public int boardDeleteOk(BoardTO to)
	{		
		int flag = 1;
		
		int result = sqlSession.delete("boardDeleteOk", to);
		if (result == 1) {
			flag = 0;
		}
		return flag;
	}
}
