package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ListAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");	
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardTO> boardList = dao.boardList();
		
		request.setAttribute("boardList", boardList);

	}

}
