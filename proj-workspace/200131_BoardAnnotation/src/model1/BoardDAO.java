package model1;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import config.SqlMapperInter;
import config.Test;

public class BoardDAO
{
	private SqlSession sqlSession = null;
	private SqlMapperInter mapper = null;

	public BoardDAO()
	{
		String resource = "myBatisConfig.xml";
		InputStream is = null;

		try {

			is = Resources.getResourceAsStream(resource);

			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
			
			sqlSession = sqlSessionFactory.openSession(true);
			
			this.sqlSession.getConfiguration().addMapper(SqlMapperInter.class);

			this.mapper = sqlSession.getMapper(SqlMapperInter.class);

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
		
		int result = mapper.insertBoardWriteOk(to);

		if (result == 1) {
			flag = 0;
		}
		
		if(sqlSession != null)
			sqlSession.close();

		return flag;
	}

	public BoardListTO boardList(BoardListTO listTO)
	{
		// cpage - paging
		int cpage = listTO.getCpage(); // 몇페이지 인지
		int recordPerPage = listTO.getRecordPerPage();//페이지당 읽는 로우갯수
		int blockPerPage = listTO.getBlockPerPage(); 
		

		ArrayList<BoardTO> totalBoardList = this.mapper.selectBoardList();
		
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
		
		if(sqlSession != null)
			sqlSession.close();
		
		return listTO;
	}

	public BoardTO boardView(BoardTO to)
	{				
		mapper.updateBoardViewHit(to.getSeq());
		to = mapper.updateBoardView(to);
		
		if(sqlSession != null)
			sqlSession.close();
		
		return to;
	}

	public BoardTO boardModify(BoardTO to)
	{	
		to = mapper.selectBoardModify(to);
		
		if(sqlSession != null)
			sqlSession.close();
		
		return to;
	}

	public int boardModifyOk(BoardTO to)
	{
		int flag = 1;

		int result = mapper.updateBoardModifyOk(to);

		if (result == 1) {
			flag = 0;
		}

		if(sqlSession != null)
			sqlSession.close();
		
		return flag;
	}

	public BoardTO boardDelete(BoardTO to)
	{
		to = mapper.selectBoardDelete(to);		

		if(sqlSession != null)
			sqlSession.close();
		
		return to;
	}

	public int boardDeleteOk(BoardTO to)
	{
		int flag = 1;

		int result = mapper.deleteBoardDeleteOk(to);
		if (result == 1) {
			flag = 0;
		}

		if(sqlSession != null)
			sqlSession.close();
		
		return flag;
	}
}
