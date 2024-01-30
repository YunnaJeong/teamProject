package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectionProvider;
import vo.NewVO;

public class NewDAO {

	public int insertNewReply(int s_id) {
		int re = 0;
		String sql = "insert into new (N_STATE,N_MSG,U_ID,I_ID,S_ID) "
				+ "values('N',concat(substr((SELECT s_title FROM study WHERE s_id = ?),1,6),'...글에 새로운 댓글이 달렸습니다.'),"
				+ "(SELECT U_ID FROM study WHERE s_id = ?),NULL,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, s_id);
			stmt.setInt(2, s_id);
			stmt.setInt(3, s_id);
			re = stmt.executeUpdate();
			ConnectionProvider.close(conn, stmt);
		} catch (Exception e) {
			System.out.println("insertNewReply 예외발생 : " + e.getMessage());
		}
		return re;
	}

	public int deleteNew(int n_id) {
		int re = 0;
		String sql = "delete new where n_id=" + n_id;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("deleteNewReply 예외발생 : " + e.getMessage());
		}
		return re;
	}

	public int updateNew(int n_id) {
		int re = 0;
		String sql = "update new set n_state='Y' where n_id=" + n_id;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("updateNewReply 예외발생 : " + e.getMessage());
		}
		return re;
	}

	public int intsertNewInquiry(String u_id, int i_id) {
		int re = -1;
		String sql = "insert into new(n_state, n_msg, u_id, i_id, s_id) " + "values(?, "
				+ "concat((select SUBSTR(i_title, 1, 5) from inquiry where i_id=?), '... 문의 답변이 완료되었습니다'), ?, ?, null)";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "N");
			pstmt.setInt(2, i_id);
			pstmt.setString(3, u_id);
			pstmt.setInt(4, i_id);
			pstmt.executeUpdate();
		} catch (Exception e) {

		}

		return re;
	}

	public ArrayList<NewVO> findAllNew(String u_id) {
		ArrayList<NewVO> list = new ArrayList<NewVO>();
		String sql = "select * from new where u_id=? order by n_id desc";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String i_id = rs.getString(5);
				String s_id = rs.getString(6);
				if (i_id == null) {
					i_id = "none";
				}
				if (s_id == null) {
					s_id = "none";
				}
				list.add(new NewVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						i_id, s_id));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;
	}

}