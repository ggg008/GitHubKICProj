package albumModel;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AlbumCommentDAO
{
	private DataSource dataSource = null;

	public AlbumCommentDAO()
	{
		// TODO Auto-generated constructor stub
		// 데이터 베이스 커넥션
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			System.out.println(
					e.getClass().getName() + " : " + e.getMessage() + " Line= " + e.getStackTrace()[0].getLineNumber());
		}
	}

	@SuppressWarnings("resource")
	public int commentWriteOk(AlbumCommentTO cto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "UPDATE album_board SET cmt=cmt+1 WHERE seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cto.getParentseq());
			pstmt.executeUpdate();
			
			sql = "INSERT INTO album_comment VALUES(0, ?, ?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cto.getWriter());
			pstmt.setString(2, cto.getPassword());
			pstmt.setString(3, cto.getContent());
			pstmt.setString(4, cto.getWip());
			pstmt.setString(5, cto.getParentseq());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				flag = 0;
			}

			// } catch(ClassNotFoundException e){
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage() + e.getStackTrace()[0].getLineNumber());
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

	public int commentDeleteOkByParent(String parentseq)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {

			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "DELETE FROM album_comment WHERE parentseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, parentseq);

			int result = pstmt.executeUpdate();
			// 0 - 비밀번호가 틀렸을경우
			// 1 - 맞을경우
			if (result == 0) {
				flag = 1;
			} else if (result == 1) {
				flag = 0;
			}

		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage() + e.getStackTrace()[0].getLineNumber());
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

	@SuppressWarnings("resource")
	public int commentDeleteOk(AlbumCommentTO cto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {

			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "DELETE FROM album_comment WHERE commentno=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cto.getCommentno());
			pstmt.setString(2, cto.getPassword());
			int result = pstmt.executeUpdate();
			// 0 - 비밀번호가 틀렸을경우
			// 1 - 맞을경우
			if (result == 0) {
				flag = 1;
			} else if (result == 1) {
				flag = 0;				
				sql = "UPDATE album_board SET cmt=cmt-1 WHERE seq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cto.getParentseq());
				pstmt.executeUpdate();
				
			}

		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage() + e.getStackTrace()[0].getLineNumber());
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

	public ArrayList<AlbumCommentTO> commentList(ArrayList<AlbumCommentTO> listCTO, String parentseq)
	{

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT commentno, writer, date_format(wdate, '%Y-%m-%d %H:%i') wdate, content FROM album_comment WHERE parentseq=? ORDER BY commentno DESC"; // evernote
			// w6
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);// 갯수를
																												// 가져오는
																												// 옵션
			pstmt.setString(1, parentseq);

			rs = pstmt.executeQuery();

			while (rs.next()) {
//			for (int i = 0; i < recordPerPage && rs.next(); ++i) {
				AlbumCommentTO cto = new AlbumCommentTO();

				cto.setCommentno(rs.getString("commentno"));
				cto.setWriter(rs.getString("writer"));
				cto.setWdate(rs.getString("wdate"));
				cto.setContent(rs.getString("content"));

				listCTO.add(cto);
			}

		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage() + e.getStackTrace()[0].getLineNumber());
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

		return listCTO;
	}
}
