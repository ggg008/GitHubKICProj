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

public class AlbumBoardDAO
{
	private DataSource dataSource = null;

	private String uploadPath = "C:/MyCloud/OneDrive/java/jsp-workspace/200110_Album/WebContent/upload/";
	int maxFileSize = 1024 * 1024 * 5; // 5mb

	public AlbumBoardDAO()
	{
		// TODO Auto-generated constructor stub
		// 데이터 베이스 커넥션
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			System.out.println(
					e.getClass().getName() + " : " + e.getMessage() + " Lie= " + e.getStackTrace()[0].getLineNumber());
		}
	}

	public String getUploadPath()
	{
		return uploadPath;
	}

	public int getMaxFileSize()
	{
		return maxFileSize;
	}

	// board_write1.jsp
	public void boardWrite()
	{
		// 사용하지 않음
	}

	// board_write1_ok.jsp
	public int boardWriteOk(AlbumBoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "INSERT INTO album_board VALUES(0, ?, ?, ?, ?, ?, ?, ?, 0, 0, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getWriter());
			pstmt.setString(3, to.getPassword());
			pstmt.setString(4, to.getContent());
			pstmt.setString(5, to.getMail());
			pstmt.setString(6, to.getImgname());
			pstmt.setString(7, to.getImgsize());
			pstmt.setString(8, to.getWip());

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

	public AlbumBoardListTO boardList(AlbumBoardListTO listTO)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, datediff(now(), wdate) wgap, hit, imgname, imgsize, cmt FROM album_board ORDER BY seq DESC"; // evernote
			// w6
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);// 갯수를
																												// 가져오는
																												// 옵션
			rs = pstmt.executeQuery();

			rs.last();
			listTO.setTotalRecord(rs.getRow());
			rs.beforeFirst();

			listTO.setTotalPage(((listTO.getTotalRecord() - 1) / recordPerPage) + 1);

			int skip = (cpage - 1) * recordPerPage;
			if (skip != 0) {
				rs.absolute(skip);
			}

			ArrayList<AlbumBoardTO> boardLists = new ArrayList<>();

//			while (rs.next()) {
			for (int i = 0; i < recordPerPage; ++i) {
				if (rs.next()) {
					AlbumBoardTO to = new AlbumBoardTO();

					to.setSeq(rs.getString("seq"));
					to.setSubject(rs.getString("subject"));
					to.setWriter(rs.getString("writer"));
					to.setWdate(rs.getString("wdate"));
					to.setWgap(rs.getInt("wgap"));
					to.setHit(rs.getString("hit"));
					to.setImgname(rs.getString("imgname"));
					to.setImgsize(rs.getString("imgsize"));
					to.setCommentNum(rs.getInt("cmt"));

					boardLists.add(to);
				}
			}

			listTO.setBoardLists(boardLists);

			int startBlock = ((cpage - 1) / blockPerPage) * blockPerPage + 1;
			int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
			if (endBlock >= listTO.getTotalPage()) {
				endBlock = listTO.getTotalPage();
			}
			listTO.setStartBlock(startBlock);
			listTO.setEndBlock(endBlock);

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

		return listTO;
	}

	@SuppressWarnings("resource")
	public AlbumBoardTO boardView(AlbumBoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "UPDATE album_board SET hit=hit+1 WHERE seq = ?";// 가능하면 *쓰지말고 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			pstmt.executeUpdate();

			sql = "SELECT subject, writer, wip, date_format(wdate, '%Y-%m-%d %h:%i:%s') wdate, hit, imgname, imgsize, content FROM album_board WHERE seq = ?";// 가능하면
			// *쓰지말고
			// 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setWip(rs.getString("wip"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setContent(rs.getString("content") == null ? "" : rs.getString("content").replaceAll("\n", "<br>"));
				to.setImgname(rs.getString("imgname"));
				to.setImgsize(rs.getString("imgsize"));
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
		return to;
	}

	public AlbumBoardTO boardModify(AlbumBoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT writer, subject, content, mail, imgname, imgsize FROM album_board WHERE seq = ?";// 가능하면
																													// *쓰지말고
																													// 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to.setWriter(rs.getString("writer"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setImgname(rs.getString("imgname"));
				to.setImgsize(rs.getString("imgsize"));

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
		return to;
	}

	@SuppressWarnings("resource")
	public int boardModifyOk(AlbumBoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT imgname FROM album_board WHERE seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			String oldImgName = null;
			if (rs.next()) {
				oldImgName = rs.getString("imgname");
			}

			String addStr = "";
			if (to.getImgname() != null) {
				addStr = String.format(", imgname='%s', imgsize='%s'", to.getImgname(), to.getImgsize());
			}

			sql = "UPDATE album_board SET writer=?, subject=?, content=?" + addStr + " WHERE seq=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getWriter());
			pstmt.setString(2, to.getSubject());
			pstmt.setString(3, to.getContent());
			pstmt.setString(4, to.getSeq());
			pstmt.setString(5, to.getPassword());

			int result = pstmt.executeUpdate();
			// 0 - 비밀번호가 틀렸을경우
			// 1 - 맞을경우
			if (result == 0) {
				flag = 1;
			} else if (result == 1) {
				flag = 0;
				if (oldImgName != null && to.getImgname() != null && !to.getImgname().equals(oldImgName)) {

					String path = uploadPath + oldImgName;
					
					File file = new File(path);
					if (file.exists()) {
						file.delete();
					}
				}
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
		return flag;
	}

	public AlbumBoardTO boardDelete(AlbumBoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT subject, writer, imgname FROM album_board WHERE seq = ?";// 가능하면 *쓰지말고 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setImgname(rs.getString("imgname"));
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
		return to;
	}

	public int boardDeleteOk(AlbumBoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {

			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "DELETE FROM album_board WHERE seq=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.setString(2, to.getPassword());

			int result = pstmt.executeUpdate();
			// 0 - 비밀번호가 틀렸을경우
			// 1 - 맞을경우
			if (result == 0) {
				flag = 1;
			} else if (result == 1) {
				flag = 0;
				String path = uploadPath + to.getImgname();
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}
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
}
