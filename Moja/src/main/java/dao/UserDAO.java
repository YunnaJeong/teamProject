package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import db.ConnectionProvider;
import vo.UserVO;


import db.ConnectionProvider;
import vo.UserVO;

public class UserDAO {
	// 회원 복수 삭제
		public int userAllDelete(String[] arr) {
			int re = -1;
			String sql = "delete from users where u_id in (";

			for (int i = 0; i < arr.length; i++) {
				sql += "'" + arr[i];
				if (i < arr.length - 1) {
					sql += "'"+ ", ";
				}
			}

			sql += "')";
			
			try {
				Connection conn = ConnectionProvider.getConnection();
				Statement stmt = conn.createStatement();
				re = stmt.executeUpdate(sql);

				ConnectionProvider.close(conn, stmt);

			} catch (Exception e) {
				System.out.println("체크 유저 삭제 " + e.getMessage());
			}

			return re;
		}

		// 회원 삭제
		public int usersDelete(String id) {
			int re = -1;
			String sql = "delete from users where u_id=?";

			try {
				Connection conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				re = pstmt.executeUpdate();

				ConnectionProvider.close(conn, pstmt);
			} catch (Exception e) {
				System.out.println("회원 삭제 " + e.getMessage());
			}

			return re;
		}

		// 회원 상세
		public UserVO usersDetail(String id) {
			UserVO vo = new UserVO();
			String sql = "select * from users where u_id=?";
			try {
				Connection conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					vo.setU_id(rs.getString(1));
					vo.setU_pw(rs.getString(2));
					vo.setU_name(rs.getString(3));
					vo.setU_birth(rs.getString(4));
					vo.setU_phone(rs.getString(5));
					vo.setU_addr(rs.getString(6));
					vo.setU_interest(rs.getString(7));
				}
				ConnectionProvider.close(conn, pstmt, rs);
			} catch (Exception e) {
				System.out.println("회원 상세 " + e.getMessage());
			}

			return vo;
		}

	//회원가입 메소드
	public int joinUser(UserVO vo) {
		int re = -1;
		String sql = "insert into users(u_id,u_pw,u_name,u_birth,u_phone,u_addr,u_interest) values(?,?,?,?,?,?,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getU_pw());
			pstmt.setString(3, vo.getU_name());
			pstmt.setString(4, vo.getU_birth());
			pstmt.setString(5, vo.getU_phone());
			pstmt.setString(6, vo.getU_addr());
			pstmt.setString(7, vo.getU_interest());
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(conn, pstmt);
			
			
			
		}catch(Exception e) {
			System.out.println("회원가입 오류 : " + e.getMessage());
		}
		
		
		return re;						
	}

	//로그인메소드
	public String login(String id, String pwd) {

		String sql = "select * from users where u_id=? and u_pw=?";
		String u_id = null;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				u_id = rs.getString(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
					
					
			
		}catch(Exception e) {
			System.out.println("로그인 실패 : "+e.getMessage());
		}
		return u_id;
	}


	// 회원 목록
//회원 목록
	public ArrayList<UserVO> usersList() {
		ArrayList<UserVO> list = new ArrayList();
		String sql = "select * from users";

		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new UserVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("회원 목록 " + e.getMessage());
		}

		return list;
	}
	
			

	//아이디찾기 메소드

	public String idFind(String id, String phone) {
		String sql = "select u_id from users where u_name=? and u_phone=?";
		String u_id = null;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u_id = rs.getString(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("아이디찾기 오류 : " + e.getMessage());
		}
		return u_id;
				
	}
	//비밀번호 찾기 메소드
	public String pwFind(String id, String name) {
		String sql ="select u_pw from users where u_id=? and u_name=?";
		String u_pw=null;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				u_pw=rs.getString(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("pwFind 오류 : " + e.getMessage());
		}
		return u_pw;
				
	}

	//아이디 중복검사 메소드
	public int idValidate(String id) {
		String sql ="select u_id from users where u_id=?";
		int re =-1;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				re=0;
				
			}else {
				re=1;
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("아이디 중복검사 오류 : " + e.getMessage());
		}
		return re;
		
	}
	// 마이페이지홈- 유저의 회원정보를 불러오는 매소드 // 
		public UserVO myInfo(String id){ 
			UserVO u=null ;
			String sql ="select * from users where u_id = '"+id+"'" ;
			
			
			try {
				Connection conn = ConnectionProvider.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()) {
					u=new UserVO(
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							null,
							rs.getString(5),
							rs.getString(6),
							rs.getString(7));
				
					
				}
				ConnectionProvider.close(conn, stmt, rs);
				System.out.println("받아온 유저정보:"+u.toString());
				
			} catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}
			return u;
		}
		
		
		// 마이페이지 정보변경- 유저의 회원정보를 수정하는 매소드 // 
		public int updateUserInfo(String id,String pwd,String name,String phone,String addr){ 
			int re=-1;
			System.out.println("전달받은 id: "+id+"pwd: "+pwd);
			String sql =
				"UPDATE users set u_pw=?,u_name=?,u_phone=?,u_addr=? WHERE u_id=?";
			
			System.out.println(sql);
			try {
				Connection conn = ConnectionProvider.getConnection();
				PreparedStatement  pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pwd);
				pstmt.setString(2, name);
				pstmt.setString(3, phone);
				pstmt.setString(4, addr);
				pstmt.setString(5, id);
				
				re = pstmt.executeUpdate();
				if(re ==1) {
					System.out.println("수정완료");
				}
				ConnectionProvider.close(conn, pstmt);
				
			} catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}
			return re;
		}
	
}