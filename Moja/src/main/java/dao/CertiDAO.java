package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import db.ConnectionProvider;
import vo.CertiDetailVO;
import vo.PassingRateVO;

public class CertiDAO {

	// 자격증 상세정보 가져오기
	public CertiDetailVO getExamDetail(int e_id) {
		CertiDetailVO Certi = null;
		String sql = "SELECT * FROM exam WHERE e_id = '" + e_id + "'";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Certi = new CertiDetailVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getInt(11),
						rs.getString(12), rs.getString(13), rs.getInt(14), rs.getString(15));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return Certi;
	}

	// 종목별 시험일정 가져오기
	public ArrayList<CertiDetailVO> getExamDate(String seriesnm) {
		ArrayList<CertiDetailVO> list = new ArrayList<CertiDetailVO>();
		String sql = "select * from exam_date " + "where DESCRIPTION LIKE '%" + seriesnm + "%'";

		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				list.add(new CertiDetailVO(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getDate(5),
						rs.getDate(6), rs.getDate(7), rs.getDate(8), rs.getDate(9), rs.getDate(10), rs.getDate(11),
						rs.getDate(12), rs.getDate(13)));
			}

			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("시험 일정 " + e.getMessage());
		}

		return list;
	}

	// 합격률 - 실기
	public PassingRateVO getPassingRateP(String jmfldnm) {
		PassingRateVO prVO = null;
		String sql = "SELECT PASSRATE FROM PASSING_RATE WHERE JMFLDNM = '" + jmfldnm
				+ "' AND EXAMTYPCCD='실기' ORDER BY IMPLYY";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String passRate2020;
			String passRate2021;
			String passRate2022;
			rs.next();
			passRate2020 = rs.getString(1);
			passRate2020 = passRate2020.substring(0, 2);
			rs.next();
			passRate2021 = rs.getString(1);
			passRate2021 = passRate2021.substring(0, 2);
			rs.next();
			passRate2022 = rs.getString(1);
			passRate2022 = passRate2022.substring(0, 2);

			prVO = new PassingRateVO(passRate2020, passRate2021, passRate2022);
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("getPassingRateP 예외발생 : " + e.getMessage());
		}

		return prVO;
	}

	// 합격률 - 필기
	public PassingRateVO getPassingRateW(String jmfldnm) {
		PassingRateVO wrVO = null;
		String sql = "SELECT PASSRATE FROM PASSING_RATE WHERE JMFLDNM = '" + jmfldnm
				+ "' AND EXAMTYPCCD='필기' ORDER BY IMPLYY";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String passRate2020;
			String passRate2021;
			String passRate2022;
			rs.next();
			passRate2020 = rs.getString(1);
			passRate2020 = passRate2020.substring(0, 2);
			rs.next();
			passRate2021 = rs.getString(1);
			passRate2021 = passRate2021.substring(0, 2);
			rs.next();
			passRate2022 = rs.getString(1);
			passRate2022 = passRate2022.substring(0, 2);

			wrVO = new PassingRateVO(passRate2020, passRate2021, passRate2022);
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("getPassingRateP 예외발생 : " + e.getMessage());
		}

		return wrVO;
	}

	// 유튜브
	/*
	public ArrayList<HashMap<String, Object>> getYoutube() {
		ArrayList<HashMap<String, Object>> y_list = new ArrayList<HashMap<String, Object>>();
		String sql = "select y_url , e_id from exam e , youtube y where e.y_id=y.y_id";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("y_url", rs.getString(1));
				map.put("e_id", rs.getInt(2));
				y_list.add(map);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("유튜브 조회 오류 : " + e.getMessage());
		}
		return y_list;
	}
	*/

	public CertiDetailVO getYoutube() {
		CertiDetailVO y = null;
		String sql = "select y_url , e_id from exam e , youtube y where e.y_id=y.y_id";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				y = new CertiDetailVO(rs.getString(1), rs.getInt(2));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return y;
	}

}
