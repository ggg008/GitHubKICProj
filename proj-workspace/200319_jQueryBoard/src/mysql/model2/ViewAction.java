package mysql.model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mysql.model1.BoardDAO;
import mysql.model1.BoardTO;

public class ViewAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ViewAction 호출");
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));

		BoardDAO dao = new BoardDAO();
		to = dao.boardView(to);
		
		request.setAttribute("seq", to.getSeq());
		request.setAttribute("subject", to.getSubject());
		request.setAttribute("writer", to.getWriter());
		request.setAttribute("mail", to.getMail());
		request.setAttribute("wip", to.getWip());
		request.setAttribute("wdate", to.getWdate());
		request.setAttribute("hit", to.getHit());
		request.setAttribute("content", to.getContent());
	}

}
