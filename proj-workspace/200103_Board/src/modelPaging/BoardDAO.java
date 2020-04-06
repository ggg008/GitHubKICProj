package modelPaging;

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

public class BoardDAO
{
	private DataSource dataSource = null;

	public BoardDAO()
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

	// board_write1.jsp
	public void boardWrite()
	{
		// 사용하지 않음
	}

	// board_write1_ok.jsp
	public int boardWriteOk(BoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "INSERT INTO pds_board1 VALUES(0, ?, ?, ?, ?, ?, ?, ?, 0, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getWriter());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getPassword());
			pstmt.setString(5, to.getContent());
			pstmt.setString(6, to.getFilename());
			pstmt.setString(7, to.getFilesize());
			pstmt.setString(8, to.getWip());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				flag = 0;
			}

			// } catch(ClassNotFoundException e){
		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
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

	public BoardListTO boardList(BoardListTO listTO)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, datediff(now(), wdate) wgap, hit, filename, filesize FROM pds_board1 ORDER BY seq DESC"; // evernote
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

			ArrayList<BoardTO> boardLists = new ArrayList<>();

//			while (rs.next()) {
			for (int i = 0; i < recordPerPage && rs.next(); ++i) {
				BoardTO to = new BoardTO();

				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setWdate(rs.getString("wdate"));
				to.setWgap(rs.getInt("wgap"));
				to.setHit(rs.getString("hit"));
				to.setFilename(rs.getString("filename"));
				to.setFilesize(rs.getString("filesize"));

				boardLists.add(to);
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

		return listTO;
	}

	@SuppressWarnings("resource")
	public BoardTO boardView(BoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "UPDATE pds_board1 SET hit=hit+1 WHERE seq = ?";// 가능하면 *쓰지말고 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			pstmt.executeUpdate();

			sql = "SELECT subject, writer, mail, wip, date_format(wdate, '%Y-%m-%d %h:%i:%s') wdate, hit, filename, filesize, content FROM pds_board1 WHERE seq = ?";// 가능하면
			// *쓰지말고
			// 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setMail(rs.getString("mail"));
				to.setWip(rs.getString("wip"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setContent(rs.getString("content") == null ? "" : rs.getString("content").replaceAll("\n", "<br>"));
				to.setFilename(rs.getString("filename"));
				to.setFilesize(rs.getString("filesize"));
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
		return to;
	}

	public BoardTO boardModify(BoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT writer, subject, content, mail, filename, filesize FROM pds_board1 WHERE seq = ?";// 가능하면
																													// *쓰지말고
																													// 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to.setWriter(rs.getString("writer"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setMail(rs.getString("mail"));
				to.setFilename(rs.getString("filename"));
				to.setFilesize(rs.getString("filesize"));

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
		return to;
	}

	@SuppressWarnings("resource")
	public int boardModifyOk(BoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT filename FROM pds_board1 WHERE seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			String oldFileName = null;
			if (rs.next()) {
				oldFileName = rs.getString("filename");
			}

			String addStr = "";
			if (to.getFilename() != null) {
				addStr = String.format(", filename='%s', filesize='%s'", to.getFilename(), to.getFilesize());
			}

			sql = "UPDATE pds_board1 SET writer=?, subject=?, content=?, mail=?" + addStr
					+ " WHERE seq=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getWriter());
			pstmt.setString(2, to.getSubject());
			pstmt.setString(3, to.getContent());
			pstmt.setString(4, to.getMail());
			pstmt.setString(5, to.getSeq());
			pstmt.setString(6, to.getPassword());

			int result = pstmt.executeUpdate();
			// 0 - 비밀번호가 틀렸을경우
			// 1 - 맞을경우
			if (result == 0) {
				flag = 1;
			} else if (result == 1) {
				flag = 0;
				if (oldFileName != null && to.getFilename() != null && !to.getFilename().equals(oldFileName)) {

					String path = "C:/MyCloud/OneDrive/java/jsp-workspace/200103_Board/WebContent/upload/"
							+ oldFileName;
					File file = new File(path);
					if (file.exists()) {
						file.delete();
					}
				}
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
		return flag;
	}

	public BoardTO boardDelete(BoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "SELECT subject, writer, filename FROM pds_board1 WHERE seq = ?";// 가능하면 *쓰지말고 다쓸것
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setFilename(rs.getString("filename"));
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
		return to;
	}

	public int boardDeleteOk(BoardTO to)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {

			conn = dataSource.getConnection();// 풀링에서 커넥션 가져옴

			String sql = "DELETE FROM pds_board1 WHERE seq=? AND password=?";
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
				String path = "C:/MyCloud/OneDrive/java/jsp-workspace/200103_Board/WebContent/upload/"
						+ to.getFilename();
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}
			}

		} catch (SQLException e) {
			System.out.println(e.getClass().getName() + " : " + e.getMessage());
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
