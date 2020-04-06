package mysql.model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mysql.model1.BoardDAO;
import mysql.model1.BoardTO;

public class ListAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ListAction 호출");

		BoardDAO dao = new BoardDAO();
		ArrayList<BoardTO> boardLists = dao.boardList();
		
		request.setAttribute("boardLists", boardLists);
	}

}
