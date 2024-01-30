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

public class Test2 {//시험정보
    public static void main(String[] args) throws IOException {
       Connection conn2 =null;
       PreparedStatement pstmt=null;
       try {
          String userName="c##project1";
          String pwd ="madang";
          String driver="oracle.jdbc.driver.OracleDriver";
          String uri3="jdbc:oracle:thin:@localhost:1521:XE";
          String sql ="insert into exam(qualgbcd,qualgbnm,seriescd,seriesnm,jmcd,jmfldnm,y_id,obligfldcd,obligfldnm,mdobligfldcd,mdobligfldnm,detail,e_count,img) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
         Class.forName(driver);
         conn2 = DriverManager.getConnection(uri3, userName, pwd);
         pstmt = conn2.prepareStatement(sql);
         System.out.println("DB연결성공");
         
           StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); /*URL*/
           urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=l%2FrX7BdMRNWFQhaCjiPa%2FBeNDsyLpgyNpQd3uZ4BBOdcQfErtwGKhMLrdn%2FRu4ZB6w%2Fb0bxBAiu%2FrCoIwG2Zug%3D%3D"); /*Service Key*/
           URL url = new URL(urlBuilder.toString());
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("GET");
           conn.setRequestProperty("Content-type", "application/json");
           System.out.println("Response code: " + conn.getResponseCode());
           BufferedReader rd;
           
           
           if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
           JSONArray itemsArray = json.getJSONObject("response")
                 .getJSONObject("body")
                    .getJSONObject("items")
                    .getJSONArray("item");
           
           for(int i=0;i<itemsArray.length();i++) {
              JSONObject currentItem = itemsArray.getJSONObject(i);
              
               
               String qualgbcd = currentItem.optString("qualgbcd", "");
                  String qualgbnm = currentItem.optString("qualgbnm", "");
                  int seriescd = currentItem.optInt("seriescd", 0);
                  String seriesnm = currentItem.optString("seriesnm", "");
                  int jmcd = currentItem.optInt("jmcd", 0);
                  String jmfldnm = currentItem.optString("jmfldnm", "");
                  int obligfldcd = currentItem.optInt("obligfldcd", 0);
                  String obligfldnm = currentItem.optString("obligfldnm", "");
                  int mdobligfldcd = currentItem.optInt("mdobligfldcd", 0);
                  String mdobligfldnm = currentItem.optString("mdobligfldnm", "");

                  
                  pstmt.setString(1, qualgbcd);
                  pstmt.setString(2, qualgbnm);
                  pstmt.setInt(3, seriescd);
                  pstmt.setString(4, seriesnm);
                  pstmt.setInt(5, jmcd);
                  pstmt.setString(6, jmfldnm);
                  pstmt.setInt(7,1);
                  pstmt.setInt(8, obligfldcd);
                  pstmt.setString(9, obligfldnm);
                  pstmt.setInt(10, mdobligfldcd);
                  pstmt.setString(11, mdobligfldnm);
                  pstmt.setString(12, "null");
                  pstmt.setInt(13, 1);
                  pstmt.setString(14, "null");                  
                  int r =pstmt.executeUpdate();
                  
                  System.out.println("SQL 실행:"+r+"개 의 row삽입");

               
           }
           rd.close();
            conn.disconnect();
       }catch(Exception e) {
          System.out.println(e.getMessage());
       }finally {
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