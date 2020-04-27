package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import modelPaging.MasDAO;
import modelPaging.MasUsersTO;

public class LoginOkAction implements MasAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("LoginOkAction 호출");
        
        MasUsersTO to = new MasUsersTO();
        to.setId(request.getParameter("idinput"));
        to.setPassword(request.getParameter("pwinput"));
        
        request.setAttribute("to", to);
        
        MasDAO dao = new MasDAO();
        int flag = dao.loginOk(to);
        
        request.setAttribute("flag", flag);
		
	}
}
