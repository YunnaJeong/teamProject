package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import db.ConnectionProvider;
import vo.WishlistVO;

public class WishlistDAO {

	public int pageSIZE = 6; // 한 화면에 보여줄 레코드수
	public int totalRecord = 0; // 전체 레코드의 수
	public int totalPage = 0; // 전체 페이지의 수

	// 마이페이지 위시리스트- 전체레코드수를 반환하는 메소드 //
	public int getTotalRecord(String id) {
		int cnt = 0;
		String sql = "select count(*) from wishlist where u_id ='" + id + "'";

		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			ConnectionProvider.close(conn, stmt);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return cnt;
	}

	// 마이페이지 위시리스트- 유저의 위시리스트를 불러오는 매소드 //
	public ArrayList<HashMap<String, Object>> myWishlist(int pageNUM, String id) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		System.out.println("스터디 전달받은 id:" + id);
		totalRecord = getTotalRecord(id);
		totalPage = (int) Math.ceil(totalRecord / (double) pageSIZE);
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;

		if (end > totalRecord) {
			end = totalRecord;
		}

		String sql = "SELECT e.e_id, e.jmfldnm, e.qualgbnm, e.mdobligfldnm,e.img "
				+ "FROM (   SELECT rownum n, e_id, jmfldnm, qualgbnm, mdobligfldnm, img FROM ( "
				+ "SELECT w.e_id, e.jmfldnm, e.qualgbnm, e.mdobligfldnm, e.img FROM wishlist w "
				+ "JOIN exam e ON w.E_ID = e.E_ID WHERE w.u_ID = ? ORDER BY w.W_ID) "
				+ "WHERE rownum <= ?) e WHERE e.n >= ? ";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("e_id", rs.getInt(1));
				map.put("jmfldnm", rs.getString(2));
				map.put("qualgbnm", rs.getString(3));
				map.put("mdobligfldnm", rs.getString(4));
				map.put("img", rs.getString(5));
				list.add(map);

				System.out.println("wishlist매소드실행 가져온 시험명:" + rs.getString(2));
				System.out.println("wishlist매소드실행 가져온 분류1:" + rs.getString(3));
				System.out.println("wishlist매소드실행 가져온 분류2:" + rs.getString(4));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return list;
	}

	// 마이페이지 위시리스트- 내위시리스트 삭제 //
	public int deleteMyWish(String e_id, String u_id) {
		System.out.println("deletedao 작동");
		System.out.println("DELETEMYWISH 전달받은 e_id: " + e_id);
		System.out.println("DELETEMYWISH 전달받은 u_id: " + u_id);
		int re = -1;
		String sql = "delete wishlist where e_id=? and u_id=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int e_idINT = Integer.parseInt(e_id);
			pstmt.setInt(1, e_idINT);
			pstmt.setString(2, u_id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return re;
	}

	// 마이페이지홈 - 담긴자격증 갯수 //
	public int myWishlistNUM(String u_id) {
		System.out.println("WHISJLISTNUM 작동");
		int re = -1;
		String sql = "select count(*) from wishlist where u_id=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				re = rs.getInt(1);

			}
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return re;
	}

	// wishlist에 추가
	public int insertWishlist(WishlistVO w) {
		int re = -1;
		String sql = "INSERT INTO WISHLIST (U_ID, E_ID) VALUES (?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, w.getU_id());
			pstmt.setInt(2, w.getE_id());
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("wishlist insert 오류 : " + e.getMessage());
		}
		return re;
	}

	// wishlist에서 삭제
	public int deleteWishlist(String u_id, int e_id) {
		int re = -1;
		String sql = "DELETE FROM WISHLIST WHERE u_id=? AND e_id=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setInt(2, e_id);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return re;
	}
	
	// wishlist에 값이 있는지 확인
	public boolean selectWishlist(String u_id, int e_id) {
	    boolean result = false;
	    String sql = "SELECT * FROM WISHLIST WHERE U_ID=? AND E_ID=?";
	    try {
	        Connection conn = ConnectionProvider.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, u_id);
	        pstmt.setInt(2, e_id);
	        ResultSet rs = pstmt.executeQuery();
	        result = rs.next(); // 결과가 있으면 true, 없으면 false
	        System.out.println("dao result 값: " + result);
	        ConnectionProvider.close(conn, pstmt, rs);
	    } catch (Exception e) {
	        System.out.println("예외발생:" + e.getMessage());
	    }
	    return result;
	}

	

}
