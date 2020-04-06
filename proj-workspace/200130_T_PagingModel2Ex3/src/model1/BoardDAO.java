package model1;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
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

	public void boardWrite()
	{
		// 사용하지 않음

	}

	public int boardWriteOk(BoardTO to)
	{
		int flag = 1;

		int result = sqlSession.insert("write_ok", to);

		if (result == 1) {
			flag = 0;
		}

		if (sqlSession != null)
			sqlSession.close();

		return flag;
	}

	public BoardListTO boardList(BoardListTO listTO)
	{
		// cpage - paging
		int cpage = listTO.getCpage(); // 몇페이지 인지
		int recordPerPage = listTO.getRecordPerPage();//페이지당 읽는 로우갯수
		int blockPerPage = listTO.getBlockPerPage(); 
		

		ArrayList<BoardTO> totalBoardList = new ArrayList<>(sqlSession.selectList("list"));
		
		listTO.setTotalRecord(totalBoardList.size());

		listTO.setTotalPage(((listTO.getTotalRecord() - 1) / recordPerPage) + 1);
		
		int fromIndex = (cpage - 1) * recordPerPage;
		int toIndex = fromIndex + recordPerPage;
		if(listTO.getTotalRecord() <= toIndex) {
			toIndex = listTO.getTotalRecord(); 
		}
		
		ArrayList<BoardTO> boardListPerPage = new ArrayList<>(totalBoardList.subList(fromIndex, toIndex));
		
		listTO.setBoardLists(boardListPerPage);

		int startBlock = ((cpage - 1) / blockPerPage) * blockPerPage + 1;
		int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
		if (endBlock >= listTO.getTotalPage()) {
			endBlock = listTO.getTotalPage();
		}
		listTO.setStartBlock(startBlock);
		listTO.setEndBlock(endBlock);
		
		if (sqlSession != null)
			sqlSession.close();

		return listTO;
	}

	public BoardTO boardView(BoardTO to)
	{		
		sqlSession.update("view_hit", to);
		to = sqlSession.selectOne("view", to);

		if (sqlSession != null)
			sqlSession.close();

		return to;
	}

	public BoardTO boardModify(BoardTO to)
	{	
		to = sqlSession.selectOne("modify", to);
		
		if (sqlSession != null)
			sqlSession.close();

		return to;
	}

	public int boardModifyOk(BoardTO to)
	{
		int flag = 1;

		int result = sqlSession.update("modify_ok", to);

		if (result == 1) {
			flag = 0;
		}

		if (sqlSession != null)
			sqlSession.close();

		return flag;
	}

	public BoardTO boardDelete(BoardTO to)
	{
		to = sqlSession.selectOne("delete", to);

		if (sqlSession != null)
			sqlSession.close();

		return to;
	}

	public int boardDeleteOk(BoardTO to)
	{
		int flag = 1;

		int result = sqlSession.delete("delete_ok", to);

		if (result == 1) {
			flag = 0;
		}

		if (sqlSession != null)
			sqlSession.close();

		return flag;
	}
}
