package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.BoardDAO;
import modelPaging.BoardTO;

public class ViewAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");		
		
		BoardDAO dao = new BoardDAO();
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to = dao.boardView(to);

		int cpage = Integer.parseInt(request.getParameter("cpage"));
		request.setAttribute("cpage", cpage);
		request.setAttribute("to", to);
	}

}
