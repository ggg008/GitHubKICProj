package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ModifyOkAction implements Action
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " call execute");	
		

		String seq = request.getParameter("seq");
		String mail = "";
		if (!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")) {
			mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
		}
		String content = request.getParameter("content");

		content = request.getParameter("content").replaceAll("\n", "<br>");
		content = request.getParameter("content").replaceAll(" ", "&nbsp;");

		/* 
			System.out.println(seq);
			System.out.println(writer);
			System.out.println(subject);
			System.out.println(password);
			System.out.println(mail);
			System.out.println(content);
		*/

		BoardDAO dao = new BoardDAO();
		BoardTO to = new BoardTO();

		to.setSeq(request.getParameter("seq"));
		to.setSubject(request.getParameter("subject"));
		to.setWriter(request.getParameter("writer"));
		to.setPassword(request.getParameter("password"));
		to.setMail(mail);
		to.setContent(content);

		int flag = dao.boardModifyOk(to);

		request.setAttribute("seq", seq);
		request.setAttribute("flag", flag);

	}

}
