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
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.JSONParser;

public class Test1 {//기술사 일정
    public static void main(String[] args) throws IOException {
       Connection conn2 =null;
       PreparedStatement pstmt=null;
       try {
          String userName="c##project1";
          String pwd ="madang";
          String driver="oracle.jdbc.driver.OracleDriver";
          String uri3="jdbc:oracle:thin:@localhost:1521:XE";
          String sql ="insert into exam_date(description,docregstartdt,docregenddt,docexamdt,docpassdt,docsubmitstartdt,docsubmitentdt,pracregstartdt,pracregenddt,pracexamstartdt,pracexamenddt,pracpassdt) values(?,?,?,?,?,?,?,?,?,?,?,?)";
         Class.forName(driver);
         conn2 = DriverManager.getConnection(uri3, userName, pwd);
         pstmt = conn2.prepareStatement(sql);
         System.out.println("DB연결성공");
         
           StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getPEList"); /*URL*/
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
              
               
               String description = currentItem.optString("description", "");
                  String docexamdt = currentItem.optString("docexamdt", "");
                  String docpassdt = currentItem.optString("docpassdt","");
                  String docregenddt = currentItem.optString("docregenddt", "");
                  String docregstartdt = currentItem.optString("docregstartdt", "");
                  String docsubmitentdt = currentItem.optString("docsubmitentdt", "");
                  String docsubmitstartdt = currentItem.optString("docsubmitstartdt", "");
                  String pracexamenddt = currentItem.optString("pracexamenddt", "");
                  String pracexamstartdt = currentItem.optString("pracexamstartdt", "");
                  String pracpassdt = currentItem.optString("pracpassdt", "");
                  String pracregenddt = currentItem.optString("pracregenddt", "");
                  String pracregstartdt = currentItem.optString("pracregstartdt", "");

                  
                  pstmt.setString(1, description);
                  pstmt.setString(2, docregstartdt);
                  pstmt.setString(3, docregenddt);
                  pstmt.setString(4, docexamdt);
                  pstmt.setString(5, docpassdt);
                  pstmt.setString(6, docsubmitstartdt);
                  pstmt.setString(7,docsubmitentdt );
                  pstmt.setString(8, pracregstartdt);
                  pstmt.setString(9, pracregenddt);
                  pstmt.setString(10, pracexamstartdt);
                  pstmt.setString(11, pracexamenddt);
                  pstmt.setString(12, pracpassdt);
                  
                  
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