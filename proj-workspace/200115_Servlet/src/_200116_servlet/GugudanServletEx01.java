package _200116_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GugudanServletEx01 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding( "utf-8" );
		
		String startdan = req.getParameter("startdan") == null ? "" : req.getParameter("startdan");
		String enddan = req.getParameter("enddan") == null ? "" : req.getParameter("enddan");
		
		resp.setContentType( "text/html;charset=utf-8" );
		
		StringBuffer html = new StringBuffer();
		html.append( "<!DOCTYPE html>" );
		html.append( "<head>" );
		html.append( "<meta charset='utf-8'>" );
		html.append( "<title></title>" );
		html.append( "</head>" );
		html.append( "<body>" );
		html.append( "<form action='./gugudan' method='post'>" );
		html.append( "시작단 : <input type='text' name='startdan' />" );
		html.append( " - " );
		html.append( "끝단 : <input type='text' name='enddan' />" );
		html.append( "&nbsp;&nbsp;<input type='submit' value='구구단 출력' />" );
		html.append( "</form>" );
		html.append( "<br /><br />" );
		if( !startdan.equals( "" ) && !enddan.equals( "" ) ) {
		 
			int iStartdan = Integer.parseInt( startdan );
			int iEnddan = Integer.parseInt( enddan );

			html.append( "<table border='1' width='800'>" );
			for( int i=iStartdan ; i<=iEnddan ; i++ ) {
				html.append( "<tr>" );
				for( int j=1 ; j<=9 ; j++ ) {
					html.append( "<td>" + i + " X " + j + " = " + ( i*j )+ "</td>" );
				}
				html.append( "</tr>" );
			}
			html.append( "</table>" );
		}
		
		html.append( "</body>" );
		html.append( "</html>" );
		
		PrintWriter out = resp.getWriter();
		out.println( html );
	}
}
