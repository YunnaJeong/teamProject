package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.ConnectionProvider;
import vo.YoutubeVO;

public class YoutubeDAO {
	
	
	
	public ArrayList<YoutubeVO> youtubeList(){
		ArrayList<YoutubeVO> vo = new ArrayList<YoutubeVO>();
		String sql = "select * from youtube";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.add(new YoutubeVO(rs.getInt(1),rs.getString(2)));
			}
		}catch(Exception e) {
			System.out.println("유튜브 목록 출력 오류 : " + e.getMessage());
		}
		return vo;
	}
	

}
