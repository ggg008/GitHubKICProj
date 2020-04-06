package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ZipcodeDAO
{
	private DataSource dataSource;

	public ZipcodeDAO()
	{
		// 데이터 베이스 커넥션
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ZipcodeTO> zipcodeList(String strDong)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ZipcodeTO> zipcodeList = new ArrayList<>();
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM zipcode WHERE dong LIKE ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + strDong + "%");
			
			/*
			 * 
			 * 메소드()
			 * 변수
			 * 
			 * */			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ZipcodeTO zto = new ZipcodeTO(); 
				
				zto.setSeq(rs.getString("Seq"));
				zto.setZipcode(rs.getString("Zipcode"));
				zto.setSido(rs.getString("Sido"));
				zto.setGugun(rs.getString("Gugun"));
				zto.setDong(rs.getString("Dong"));
				zto.setRi(rs.getString("Ri"));
				zto.setBunji(rs.getString("Bunji"));
				
				zipcodeList.add(zto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		
		
		return zipcodeList;
	}
}
