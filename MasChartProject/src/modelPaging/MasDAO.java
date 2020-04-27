package modelPaging;

import java.nio.channels.ScatteringByteChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MasDAO
{

	private DataSource dataSource = null;

	public MasDAO()
	{
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
	
	public int countCandelstick(ChartListInfoTOTemp chartListTO, String ... timeOption)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int count = 0;
		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴
			
			String sql = "SELECT count(*) FROM chart_candlesticks";
			pstmt = conn.prepareStatement(sql);
			if(chartListTO != null) {
				sql = "SELECT count(*) FROM chart_candlesticks WHERE candleKey LIKE ?";
				pstmt = conn.prepareStatement(sql);
				String range = chartListTO.getFromSymbol() + chartListTO.getToSymbol() + timeOption[0] + "%";				
				pstmt.setString(1,  range);				
			}
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = Integer.valueOf( rs.getString("count(*)") );
			}
			
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return count;
	}

	public CandlestickTO getCandlestick(CandlestickTO cTo) {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT * FROM chart_candlesticks WHERE candleKey LIKE ?";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);// 갯수를
																											// 옵션
			pstmt.setString(1, cTo.getCandleKey() + "%");
			
			rs = pstmt.executeQuery();


			while (rs.next()) {
				cTo.setCandleJSON(rs.getString("candleJSON"));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return cTo;
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
	

	public ArrayList<CandlestickTO> getCandlestickList(ChartListInfoTOTemp cliTo, String...timeOption) {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<CandlestickTO> candlestickList = new ArrayList<>();
		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT * FROM chart_candlesticks WHERE candleKey LIKE ?";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);// 갯수를
																											// 옵션
			pstmt.setString(1, cliTo.getFromSymbol() + cliTo.getToSymbol() + timeOption[0] + "%");
			
			rs = pstmt.executeQuery();


			while (rs.next()) {
				CandlestickTO cto = new CandlestickTO();

				cto.setCandleKey(rs.getString("candleKey"));
				cto.setCandleJSON(rs.getString("candleJSON"));

				candlestickList.add(cto);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return candlestickList;
	}
	

	public boolean setCandlestick(CandlestickTO cTo)
	{

		Connection conn = null;
		PreparedStatement pstmt = null;

		boolean isSuccess = false;

		try {
			conn = dataSource.getConnection();

			String sql = "INSERT INTO chart_candlesticks VALUES(?, ?) ON DUPLICATE KEY UPDATE candleKey=?, candleJSON=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cTo.getCandleKey());
			pstmt.setString(2, cTo.getCandleJSON());
			pstmt.setString(3, cTo.getCandleKey());//존재시 덮어쓰우는 옵션
			pstmt.setString(4, cTo.getCandleJSON());
			
			isSuccess = pstmt.executeUpdate() == 1 ? true : false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러:" + e.getMessage());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return isSuccess;

	}
	
	public void setCandlestickBulk(ArrayList<CandlestickTO> cToList)
	{

		Connection conn = null;
		PreparedStatement pstmt = null;

		boolean isSuccess = false;

		try {
			conn = dataSource.getConnection();

			String sql = "INSERT INTO chart_candlesticks VALUES(?, ?) ON DUPLICATE KEY UPDATE candleKey=?, candleJSON=?";
			pstmt = conn.prepareStatement(sql);
			for (CandlestickTO cTo : cToList) {
				pstmt.setString(1, cTo.getCandleKey());
				pstmt.setString(2, cTo.getCandleJSON());
				pstmt.setString(3, cTo.getCandleKey());//존재시 덮어쓰우는 옵션
				pstmt.setString(4, cTo.getCandleJSON());
				
				isSuccess = pstmt.executeUpdate() == 1 ? true : false;
				if(!isSuccess) {					
					System.out.println("실패 : " + cTo.getCandleKey() + "-" + cTo.getCandleJSON());
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러:" + e.getMessage());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}


	// authentication-register.html
	public void signup()
	{

	}

	// signup.jsp
	public int signupOk(MasUsersTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();

			String sql = "insert into users values(?, ?, null, ?, now(), null, null)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getId());
			pstmt.setString(2, to.getEmail());

			if (to.getPassword().equals(to.getCpassword())) {

				pstmt.setString(3, to.getPassword());

			} else if (!to.getPassword().equals(to.getCpassword())) {
				flag = 3;
			}

			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 2;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러:" + e.getMessage());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return flag;

	}

	// form-basic.html

}
