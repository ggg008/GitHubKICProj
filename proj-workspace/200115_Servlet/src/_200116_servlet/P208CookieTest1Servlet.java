package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieTest1Server
 */
@WebServlet("/cookie1")
public class P208CookieTest1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public P208CookieTest1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		Cookie c1 = new Cookie("id", "guest");
		c1.setPath("/");
		resp.addCookie(c1);
		//유효기간이 없다면 페이지 종료시 바로 제거

		Cookie c2 = new Cookie("code", "0001");
		c2.setMaxAge(60 * 60 * 3); //쿠키유효기간 초단위 설정 60초 * 60 *3 이면 = 3시간
		c2.setPath("/");
		resp.addCookie(c2);

		Cookie c3 = new Cookie("subject", "java");
		c3.setMaxAge(60 * 60 * 24 * 10); //60초 * 60 * 24 * 10 이면 = 10일
		c3.setPath("/");
		resp.addCookie(c3);
		
		out.println("쿠키 전송 완료");
		out.close();
	}

}
