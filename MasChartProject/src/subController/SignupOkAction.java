package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.MasDAO;
import modelPaging.MasUsersTO;

public class SignupOkAction implements MasAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("SignupOkAction 호출");

		MasUsersTO to = new MasUsersTO();
		to.setId(request.getParameter("signupId"));
		to.setEmail(request.getParameter("signupEmail"));
		to.setPassword(request.getParameter("signupPassword"));
		to.setCpassword(request.getParameter("signupCpassword"));
		
		MasDAO dao = new MasDAO();
		int flag = dao.signupOk(to);
		
		request.setAttribute("flag", flag);
		
	}

}
