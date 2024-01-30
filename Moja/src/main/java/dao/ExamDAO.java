package dao;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.ConnectionProvider;
import vo.ExamVO;
import java.util.ArrayList;
import java.util.HashMap;

import db.ConnectionProvider;
import vo.ExamVO;

public class ExamDAO {
	// 시험 상세
	public ExamVO examDetail(int e_id) {
		ExamVO e = new ExamVO();
		String sql = "select * from exam where e_id=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, e_id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				e.setE_id(e_id);
				e.setQualgbcd(rs.getString(2));
				e.setQualgbnm(rs.getString(3));
				e.setSeriescd(rs.getInt(4));
				e.setSeriesnm(rs.getString(5));
				e.setJmcd(rs.getInt(6));
				e.setJmfldnm(rs.getString(7));
				e.setY_id(rs.getInt(8));
				e.setObligfldcd(rs.getInt(9));
				e.setObligfldnm(rs.getString(10));
				e.setMdobligfldcd(rs.getInt(11));
				e.setMdobligfldnm(rs.getString(12));
				e.setDetail(rs.getString(13));
				e.setE_count(rs.getInt(14));
			}

		} catch (Exception e2) {
			System.out.println("시험 상세 " + e2.getMessage());
		}

		return e;
	}

	// 시험 전체 목록
	public ArrayList<ExamVO> allExamList() {
		ArrayList<ExamVO> list = new ArrayList<ExamVO>();
		String sql = "select * from exam";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new ExamVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getInt(11),
						rs.getString(12), rs.getString(13), rs.getInt(14)));
			}
			ConnectionProvider.close(conn, stmt, rs);

		} catch (Exception e) {
			System.out.println("시험 목록 : " + e.getMessage());
		}
		return list;
	}

	
	//페이징 처리 위한 변수
	public static int pageSize=10;
	public static int totalRecord=0;
	public static int totalPage=0;
	
	public int getTotalRecord(String category,String search) {
		int re=0;
		String sql ="select count(*) from exam";
		if(category==null) {
			category = "";
		}
		if(search!=null) {
			sql += " WHERE jmfldnm LIKE '%"+search+"%' AND obligfldnm LIKE '%"+category+"%' ";
		}
		System.out.println(sql);
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				re=rs.getInt(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}
	
	
	public ArrayList<ExamVO> pagingExam(int pageNum, String search, String bCate){
		ArrayList<ExamVO> list = new ArrayList<ExamVO>();

		totalRecord=getTotalRecord(bCate,search);
		totalPage=(int)Math.ceil(totalRecord*1.0/pageSize);
		
		int start = (pageNum-1)*pageSize +1;
		int end = start+pageSize-1;
		if(end>totalRecord) {
			end=totalRecord;
		}
		if(search==null) {
			search="";
		}
		if(bCate==null) {
			bCate="";
		}
		String sql ="SELECT e_id, qualgbcd, qualgbnm, seriescd, seriesnm, jmcd, jmfldnm, y_id, obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, detail, e_count, img " +
				"FROM ( " +
				"    SELECT e_id, qualgbcd, qualgbnm, seriescd, seriesnm, jmcd, jmfldnm, y_id, obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, detail, e_count, img, " +
				"           ROW_NUMBER() OVER (ORDER BY e_id DESC) AS rnum " +
				"    FROM exam " +
				"    WHERE jmfldnm LIKE '%"+search+"%' AND obligfldnm LIKE '%"+bCate+"%' " +
				") " +
				"WHERE rnum BETWEEN ? AND ?";
		
		
		System.out.println(sql);
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			System.out.println(start);
			System.out.println(end);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ExamVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10),rs.getInt(11),rs.getString(12),rs.getString(13),rs.getInt(14),rs.getString(15)));

			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch (Exception e) {
			System.out.println("paging 오류 : " + e.getMessage());
		}
		return list;
	}
	
	
	
	//대직무분야명 목록 리스트 출력메소드
	public ArrayList<String> obligfldnmList(){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select distinct obligfldnm from exam where obligfldnm is not null";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		ConnectionProvider.close(conn, pstmt, rs);	
		}
		
		catch(Exception e) {
			System.out.println("목록 출력 실패 : " + e.getMessage());
		}
		return list;
	}
	
	//유저관심목록
	public String userInterest(String u_id) {
		String str="";
		String sql ="select u_interest from users where u_id = ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				str=rs.getString(1);
			}
			System.out.println(str);
		}catch(Exception e) {
			System.out.println("유저 관심목록 출력 오류"+e.getMessage());
		}
		
		
		return str;
	}
	
	//관심목록에 해당하는 자격증 정보 출력
	public ArrayList<ExamVO> interestExam(String interest){
		ArrayList<ExamVO> list = new ArrayList<ExamVO>();
		String sql = "select * from exam where mdobligfldnm ='"+interest+"'";
		try {

			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(sql);
			while(rs.next()) {
				list.add(new ExamVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10),rs.getInt(11),rs.getString(12),rs.getString(13),rs.getInt(14),rs.getString(15)));

			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			
			System.out.println("관심목록에 해당하는 자격증 정보 출력 오류"+e.getMessage());
		}
		return list;
	}
	//중직무분야명 목록 리스트 출력 메소드
	public ArrayList<String> mdobligfldnmList(){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select distinct mdobligfldnm from exam where mdobligfldnm is not null";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}

		catch (Exception e) {
			System.out.println("목록 출력 실패 : " + e.getMessage());

		}
		return list;
	}
	
	//자격증 총 갯수 출력
	public int totalExamCount() {
		String sql = "select count(*) from exam";
		int re=0;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				re = rs.getInt(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
			
		}catch(Exception e) {
			System.out.println("총 시험 갯수 출력오류 : "+ e.getMessage()); 
		}
		return re;
	}
	
	
	//조회수가 높은 시험수 4개 정보 출력
	public ArrayList<ExamVO> bestExamList(){
		ArrayList<ExamVO> list = new ArrayList<ExamVO>();
		String sql = "SELECT e_id, qualgbcd, qualgbnm, seriescd, seriesnm, jmcd, jmfldnm, y_id, obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, detail, e_count, img FROM (  SELECT rownum n, e_id, qualgbcd, qualgbnm, seriescd, seriesnm, jmcd, jmfldnm, y_id, obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, detail, e_count, img FROM ( SELECT e_id, qualgbcd, qualgbnm, seriescd, seriesnm, jmcd, jmfldnm, y_id, obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, detail, e_count, img FROM exam ORDER BY e_count DESC ))WHERE n <= ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 4);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ExamVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10),rs.getInt(11),rs.getString(12),rs.getString(13),rs.getInt(14),rs.getString(15)));
			}
			ConnectionProvider.close(conn, pstmt, rs);
					
		}catch(Exception e) {
			System.out.println("인기순 시험 출력 오류 : " + e.getMessage());
		}
		return list;
	}
	
	//전체 자격증 목록 출력
	public ArrayList<ExamVO> examList(){
		ArrayList<ExamVO> list = new ArrayList<ExamVO>();
		String sql ="select * from exam";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ExamVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getInt(9),rs.getString(10),rs.getInt(11),rs.getString(12),rs.getString(13),rs.getInt(14),rs.getString(15)));
			}
			ConnectionProvider.close(conn, pstmt, rs);
					
		}catch(Exception e) {
			System.out.println("자격증 전체 목록 출력오류 : " + e.getMessage());
		}
		return list;
	}
	
	//유튜브 링크 조인해서 가져오는 메소드
	public ArrayList<HashMap<String, Object>> listYoutube(){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql ="select y_url , e_id from exam e , youtube y where e.y_id=y.y_id";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("y_url", rs.getString(1));
				map.put("e_id", rs.getInt(2));
				list.add(map);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("유튜브 조회 오류 : " + e.getMessage());
		}
		return list;
	}

		
	}