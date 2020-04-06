package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class P226LoginOutServlet
 */
@WebServlet("/logProc")
public class P226LoginOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public P226LoginOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    //로그인 처리
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setCharacterEncoding("utf-8");
    	
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		if(id.isEmpty() || pwd.isEmpty()) {
			out.print("ID 또는 비밀번호를 입력해주세요");
			return;
		}
		//새로운 세션정보 생성
    	HttpSession session = req.getSession();
    	if(session.isNew() || session.getAttribute("id") == null) {
    		session.setAttribute("id", id);
//    		out.print("로그인을 완료하였습니다");
    		out.println("<script type='text/javascript'>");
    		out.println("	alert('로그인을 완료하였습니다')");
    		out.println("	location.href='./200116_Servlet/p225loginOut.jsp'");
//    		out.println("history.back();");
    		out.println("</script>");
    	} else {
//    		out.print("현재 로그인 상태입니다");
    		out.println("<script type='text/javascript'>");
    		out.println("	alert('현재 로그인 상태입니다')");
    		out.println("	location.href='./200116_Servlet/p225loginOut.jsp'");
    		out.println("</script>");
		}     	
    }    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //로그아웃 처리
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		//존재하는 기존 세션이 없으면 null을 반환 하라는 의미 - returns null. 
		HttpSession session = req.getSession(false);
    	if(session != null && session.getAttribute("id") != null) {
    		session.invalidate();//세션 객체 삭제
//    		out.print("로그아웃을 완료하였습니다");
    		out.println("<script type='text/javascript'>");
    		out.println("	alert('로그아웃을 완료하였습니다')");
    		out.println("	location.href='./200116_Servlet/p225loginOut.jsp'");
    		out.println("</script>");
    	} else {
//    		out.print("현재 로그인 상태가 아닙니다");
    		out.println("<script type='text/javascript'>");
    		out.println("	alert('현재 로그인 상태가 아닙니다')");
    		out.println("	location.href='./200116_Servlet/p225loginOut.jsp'");
    		out.println("</script>");
		} 
    	out.close();
	}

}
