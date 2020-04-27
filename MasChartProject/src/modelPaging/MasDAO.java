package modelPaging;

import java.nio.channels.ScatteringByteChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	// authentication-login.html
	public void login() {
		
	}
	
	// login.jsp
	public int loginOk(MasUsersTO to) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = to.getId();
		String password = to.getPassword();
		
		String saved_id = "";
		String saved_password = "";
		
		try {
			conn = dataSource.getConnection();
			String sql = "select id, password from users where id= ? and password= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				saved_id =  rs.getString("id");
				saved_password = rs.getString("password");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러:" + e.getMessage());
		} finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		
	    int flag;
	    
	    if(id.equals("") && password.equals("")) {
	        flag = 0;
	    } else if(id.equals(saved_id) && password.equals(saved_password)) {
	        flag = 1;
	    } else {
	    	flag = 2;
	    }
		
		return flag;
	}
	
	public void logout() {
		
	}
	
	// authentication-register.html
	public void signup() {
		
	}
	
	// signup.jsp
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
