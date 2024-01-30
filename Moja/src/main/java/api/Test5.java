package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.JSONParser;

public class Test5 {// 합격률
	public static void main(String[] args) throws IOException {
		Connection conn2 = null;
		PreparedStatement pstmt = null;
		try {
			String userName = "c##project1";
			String pwd = "madang";
			String driver = "oracle.jdbc.driver.OracleDriver";
			String uri3 = "jdbc:oracle:thin:@localhost:1521:XE";
			String sql = "insert into passing_rate(examPassCnt, examTypCcd, grdNm,implSeq,implYy ,jmFldNm,passRate,recptNoCnt) values(?,?,?,?,?,?,?,?)";
			Class.forName(driver);
			conn2 = DriverManager.getConnection(uri3, userName, pwd);
			pstmt = conn2.prepareStatement(sql);
			System.out.println("DB연결성공");

			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.q-net.or.kr/api/service/rest/InquiryQualPassRateSVC/getList"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=l%2FrX7BdMRNWFQhaCjiPa%2FBeNDsyLpgyNpQd3uZ4BBOdcQfErtwGKhMLrdn%2FRu4ZB6w%2Fb0bxBAiu%2FrCoIwG2Zug%3D%3D"); /*
																																	 * Service
																																	 * Key
																																	 */
			urlBuilder.append(
					"&" + URLEncoder.encode("grdCd", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 등급코드 */
			urlBuilder.append(
					"&" + URLEncoder.encode("baseYY", "UTF-8") + "=" + URLEncoder.encode("2023", "UTF-8")); /* 기준연도 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("100", "UTF-8")); /* 페이지당 데이터 수 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;

			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			JSONObject json = new JSONObject();
			json = XML.toJSONObject(sb.toString());
			System.out.println(json.getJSONObject("response"));

			System.out.println(json.getJSONObject("response").getJSONObject("body").getJSONObject("items"));
			JSONArray itemsArray = json.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item");

			for (int i = 0; i < itemsArray.length(); i++) {
				JSONObject currentItem = itemsArray.getJSONObject(i);

				String examPassCnt = currentItem.optString("examPassCnt", "");
				String examTypCcd = currentItem.optString("examTypCcd", "");
				String grdNm = currentItem.optString("grdNm", "");
				String implSeq = currentItem.optString("implSeq", "");
				String implYy = currentItem.optString("implYy", "");
				String jmFldNm = currentItem.optString("jmFldNm", "");
				String passRate = currentItem.optString("passRate", "");
				String recptNoCnt = currentItem.optString("recptNoCnt", "");

				pstmt.setString(1, examPassCnt);
				pstmt.setString(2, examTypCcd);
				pstmt.setString(3, grdNm);
				pstmt.setString(4, implSeq);
				pstmt.setString(5, implYy);
				pstmt.setString(6, jmFldNm);
				pstmt.setString(7, passRate);
				pstmt.setString(8, recptNoCnt);

				int r = pstmt.executeUpdate();

				System.out.println("SQL 실행:" + r + "개 의 row삽입");

			}
			rd.close();
			conn.disconnect();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// Close resources in the finally block
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn2 != null) {
					conn2.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
