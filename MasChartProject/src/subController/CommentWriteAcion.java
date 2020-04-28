package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.MasCommentTO;

public class CommentWriteAcion implements MasAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("CommentWriteAction 호출");
		
		MasCommentTO to = new MasCommentTO();
		to.setId(request.getParameter("json.sessID"));
		to.setContent(request.getParameter("cmttxt"));
		
		System.out.println(request.getParameter("json.sessID"));
		System.out.println(request.getParameter("cmttxt"));
	}

}
