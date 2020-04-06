package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.BoardDAO;
import modelPaging.BoardTO;

public class DeleteAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");		


		String seq = request.getParameter("seq");

		BoardDAO dao = new BoardDAO();
		BoardTO to = new BoardTO();
		to.setSeq(seq);
		to = dao.boardDelete(to);
		
		request.setAttribute("to", to);
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		request.setAttribute("cpage", cpage);
		request.setAttribute("to", to);
	}
}
