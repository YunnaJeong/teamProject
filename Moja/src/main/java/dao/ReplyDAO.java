package dao;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectionProvider;
import vo.ReplyVO;


public class ReplyDAO {
	
	public ArrayList<ReplyVO> replyList(int s_id) {
		ArrayList<ReplyVO> replyList = new ArrayList<ReplyVO>();
		String sql = "select * from reply where s_id=" + s_id + " order by r_id asc";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				replyList.add(new ReplyVO(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getInt(4), rs.getString(5)));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("replyList 예외발생 :" + e.getMessage());
		}
		return replyList;
	}

	public int replyWrite(String R_CONTENT, int s_id, String u_id) {
		int re = 0;
		String sql = "INSERT INTO reply(R_CONTENT,R_DATE,S_ID,U_ID) values(?, sysdate, ?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, R_CONTENT);
			pstmt.setInt(2, s_id);
			pstmt.setString(3, u_id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("replyWrite 예외발생 :" + e.getMessage());
		}
		return re;
	}

	public int replyDelete(int r_id) {
		int re = 0;
		String sql = "delete reply where r_id = ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("replyWrite 예외발생 :" + e.getMessage());
		}
		return re;
	}
	

	// 스터디 갯수 가져오기
	public int countReply(int s_id) {
		int cnt = 0;
		String sql = "select count(*) from reply where s_id=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			
			ConnectionProvider.close(conn, pstmt, rs);
			
		} catch (Exception e) {
			System.out.println("스터디에 맞는 모든 댓글 " + e.getMessage());
		}
		
		return cnt;
	}
	
	// 스터디에 맞는 모든 댓글
	public ArrayList<ReplyVO> findAllReply(int s_id) {
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		String sql = "select * from reply where s_id=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				list.add(new ReplyVO(
						rs.getInt(1),
						rs.getString(2),
						rs.getDate(3),
						rs.getInt(4),
						rs.getString(5)
						));
			}
		} catch (Exception e) {
			System.out.println("스터디에 맞는 모든 댓글 " + e.getMessage());
		} 
		
		return list;
	}
}