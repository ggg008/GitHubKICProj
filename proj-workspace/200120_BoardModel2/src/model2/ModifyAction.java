package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ModifyAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");		

		BoardDAO dao = new BoardDAO();
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to = dao.boardModify(to);
		
		request.setAttribute("to", to);
	}

}
