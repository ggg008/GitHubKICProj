package com.exam.hello;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ZipMaven
{

	public static void main(String[] args)
	{
		String url = "jdbc:mysql://localhost:3306/project";
		String user = "project";
		String pass = "123456";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sb = new StringBuffer();

		int totalRecord = 0;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);

			String sql = "SELECT seq, zipcode, sido, gugun, dong, ri, bunji      \r\n" + "		FROM zipcode \r\n"
					+ "		WHERE dong LIKE ?"; // evernote w6
			pstmt = conn.prepareStatement(sql);// 갯수를 가져오는 옵션
			pstmt.setString(1, "신사%");

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String seq = rs.getString("seq");
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");// .substring(0, rs.getString("wdate").length() - 10);
				String dong = rs.getString("dong");
				String ri = rs.getString("ri");
				String bunji = rs.getString("bunji");
				System.out.printf("%s★%s★%s★%s★%s★%s★%s\n", seq, zipcode, sido, gugun, dong, ri, bunji);


			}

		} catch (ClassNotFoundException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
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
	}

}
