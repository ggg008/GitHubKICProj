package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ModifyOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println( "ModifyOkAction 호출" );
		
		String cpage = request.getParameter( "cpage" );
		
		BoardTO to = new BoardTO();

		String mail = "";
		if(!request.getParameter( "mail1" ).equals("") && !request.getParameter( "mail2" ).equals("")) {
			mail = request.getParameter( "mail1" ) + "@" + request.getParameter( "mail2" );	
		}

		to.setSeq( request.getParameter( "seq" ) );
		to.setSubject( request.getParameter( "subject" ) );	
		to.setWriter(request.getParameter( "writer" ));
		to.setMail( mail );
		to.setPassword( request.getParameter( "password" ) );
		to.setContent( request.getParameter( "content" ) );
		
		BoardDAO dao = new BoardDAO();
		int flag = dao.boardModifyOk( to );
		
		request.setAttribute( "cpage", cpage );
		request.setAttribute( "to", to );
		request.setAttribute( "flag", flag );
	}

}
