package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.BoardDAO;
import modelPaging.BoardTO;

public class DeleteOkAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to.setPassword(request.getParameter("password"));

		BoardDAO dao = new BoardDAO();
		int flag = dao.boardDeleteOk(to);
		
		request.setAttribute("flag", flag);

	}

}
