package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.BoardDAO;
import modelPaging.BoardTO;

public class WriteOkAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");	

		String mail = "";
		if (!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
			mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
		}

		String content = request.getParameter("content");
		content = request.getParameter("content").replaceAll("\n", "<br>");
		content = request.getParameter("content").replaceAll(" ", "&nbsp;");

		//System.out.println(content);

		BoardTO to = new BoardTO();
		to.setSubject(request.getParameter("subject"));
		to.setWriter(request.getParameter("writer"));
		to.setPassword(request.getParameter("password"));
		to.setWip(request.getRemoteAddr());
		to.setMail(mail);
		to.setContent(content);
		

		BoardDAO dao = new BoardDAO();
		int flag = dao.boardWriteOk(to);
		
		request.setAttribute("flag", flag);		
	}

}
