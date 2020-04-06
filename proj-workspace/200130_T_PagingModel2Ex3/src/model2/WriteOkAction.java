package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class WriteOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println( "WriteOkAction 호출" );
		
		String mail = "";
		if(!request.getParameter( "mail1" ).equals("") && !request.getParameter( "mail2" ).equals("")) {
			mail = request.getParameter( "mail1" ) + "@" + request.getParameter( "mail2" );	
		}
		
		BoardTO to = new BoardTO();
		to.setSubject( request.getParameter( "subject" ) );
		to.setWriter( request.getParameter( "writer" ) );
		to.setMail( mail );
		to.setPassword( request.getParameter( "password" ) );
		to.setContent( request.getParameter( "content" ) );
		to.setWip( request.getRemoteAddr() );
		
		BoardDAO dao = new BoardDAO();
		int flag = dao.boardWriteOk( to );
		
		request.setAttribute("flag", flag);
	}
}






