package modelPaging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MasDAO {

	private DataSource dataSource = null;
	
	public MasDAO() {
		// TODO Auto-generated constructor stub
		// DB Connect
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("에러:" + e.getMessage());
		}
		
	}
	
	// index.html // id, img 
	
	
	// authentication-login.html
	
	
	// authentication-register.html
	public void signup() {
		
	}
	
	public int signupOk(MasUsersTO to) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into users values(?, ?, null, ?, now(), null, null)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getId());
			pstmt.setString(2, to.getEmail());
			
			if(to.getPassword().equals(to.getCpassword())) {
				
				pstmt.setString(3, to.getPassword());
				
			} else if(!to.getPassword().equals(to.getCpassword())) {
				flag = 3;
			} 
			
			int result = pstmt.executeUpdate();

			if(result == 1) {
				flag = 2;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러:" + e.getMessage());
		} finally {
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		
		return flag;
		
	}
	
	
	
	// form-basic.html
	
	
	

}
