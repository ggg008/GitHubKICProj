package subController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.BoardDAO;
import modelPaging.BoardListTO;
import modelPaging.BoardTO;

public class ListAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");	
				
		
		int cpage = 1;
		if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}

		BoardListTO listTO = new BoardListTO();
		listTO.setCpage(cpage);

		BoardDAO dao = new BoardDAO();
		listTO = dao.boardList(listTO);

		int recordPerPage = listTO.getRecordPerPage();// 한페이지당 출력 데이터 갯수
		int totalRecord = listTO.getTotalRecord();//전체 데이터 갯수
		int totalPage = listTO.getTotalPage();
		int blockPerPage = listTO.getBlockPerPage();

		int startBlock = listTO.getStartBlock();
		int endBlock = listTO.getEndBlock();

		ArrayList<BoardTO> boardLists = listTO.getBoardLists();

		request.setAttribute("cpage", cpage);
		request.setAttribute("recordPerPage", recordPerPage);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("blockPerPage", blockPerPage);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("boardList", boardLists);
	}

}
