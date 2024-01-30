package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectionProvider;
import vo.QnaVO;

public class QnaDAO {
	// QNA 복수 삭제
	public int qnaAllDelete(String[] arr) {
		int re = -1;
		String sql = "delete from qna where q_id in (";

		for (int i = 0; i < arr.length; i++) {
			sql += Integer.parseInt(arr[i]);
			if (i < arr.length - 1) {
				sql += ", ";
			}
		}

		sql += ")";

		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);

			ConnectionProvider.close(conn, stmt);

		} catch (Exception e) {
			System.out.println("체크 qna 삭제 " + e.getMessage());
		}

		return re;
	}

	// QNA 상세
	public QnaVO qnaDetail(int q_id) {
		QnaVO q = new QnaVO();
		String sql = "select * from qna where q_id=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				q.setQ_id(q_id);
				q.setQ_title(rs.getString(2));
				q.setQ_answer(rs.getString(3));
			}

			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("qna 상세 " + e.getMessage());
		}

		return q;
	}

	// QNA 목록 가져오는 메소드
	public ArrayList<QnaVO> qnaList() {
		ArrayList<QnaVO> list = new ArrayList();
		String sql = "select * from qna";

		try {
			Connection conn = ConnectionProvider.getConnection();
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new QnaVO(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}

			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("QNA 목록 " + e.getMessage());
		}

		return list;
	}

	// QNA 추가 메소드
	public int qnaInsert(String title, String answer) {
		int re = -1;
		String sql = "insert into qna(q_title, q_answer) values(?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, answer);

			re = pstmt.executeUpdate();

			ConnectionProvider.close(conn, pstmt);

		} catch (Exception e) {
			System.out.println("QNA 추가 " + e.getMessage());
		}

		return re;
	}

	// QNA 수정 메소드
	public int qnaUpdate(int q_id, String title, String answer) {
		int re = -1;
		String sql = "update qna set q_title=?, q_answer=?  where q_id=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, answer);
			pstmt.setInt(3, q_id);

			re = pstmt.executeUpdate();

			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("qna 수정 " + e.getMessage());
		}

		return re;
	}

	// QNA 삭제 메소드
	public int qnaDelete(int q_id) {
		int re = -1;
		String sql = "delete from qna where q_id = ?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_id);

			re = pstmt.executeUpdate();

			ConnectionProvider.close(conn, pstmt);

		} catch (Exception e) {
			System.out.println("qna 삭제 " + e.getMessage());
		}

		return re;
	}

	public ArrayList<QnaVO> qnaList2(int q_id) {

		ArrayList<QnaVO> list = new ArrayList<QnaVO>();

		String sql = "select * from qna where q_id = ?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new QnaVO(rs.getInt(1), rs.getString(2), rs.getString(3)));

			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return list;
	}
}