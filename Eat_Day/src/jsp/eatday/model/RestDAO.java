package jsp.eatday.model;

import java.sql.*;
import java.util.*;


//@WebServlet("/select")
public class RestDAO { 
   Connection conn=null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   Statement stmt = null;
   
   //가게 아이디(메뉴 찾기위함), 가게이름 return
   public ArrayList<Rest> getLocation(String data1, String data2, String data3){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select id, name, address, number, salestime from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         if (data1 != "" && data2 == "" && data3 == "") {
            SQL += " where lacation = '" + data1+"'";
         }
         
         if (data1 == "" && data2 != "" && data3 == "") {
            SQL += " where classfy = '" + data2+"'";
         }

         if (data1 == "" && data2 == "" && data3 != "") {
            SQL += " where weather = '" + data3+"'";
         }
         
         if (data1 != "" && data2 != "" && data3 == "") {
            SQL += " where location = '" + data1 +"'and classfy = '" + data2+"'";
         }
         if (data1 != "" && data2 == "" && data3 != "") {
            SQL += " where location = '" + data1 +"'and weather = '" + data3+"'";
         }
         if (data1 == "" && data2 != "" && data3 != "") {
            SQL += " where classfy = '" + data2 +"'and weather = '" + data3+"'";
         }
         if (data1 != "" && data2 != "" && data3 != "") {
            SQL += " where location = '" + data1 +"'and classfy = '" + data2 +"'and weather = '" + data3+"'";
         }
         
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setId(rs.getString(1));
            rest.setName(rs.getString(2));
            rest.setAddress(rs.getString(3));
            rest.setNumber(rs.getInt(4));
            rest.setSalestime(rs.getString(5));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }
   
   //핀 안에서 자세히 보기 눌렀을때, 보여지는 부분
   public ArrayList<Rest> getInfo(String data){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select address, number, salestime from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         if (data != null) {
            SQL += " where name = " + data;
         }
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
   //결과를 저장하는 객체인 rs 객체를 생성한다.
   //stmt.executeQuery는 괄호 안에 있는 쿼리문을 실행하라는 뜻.
   //실행한 결과를 rs 객체에 넣는다.
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setAddress(rs.getString(1));
            rest.setNumber(rs.getInt(2));
            rest.setSalestime(rs.getString(3));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }
   
   public ArrayList<Rest> getTest(){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select * from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
         System.out.println("success");
   //결과를 저장하는 객체인 rs 객체를 생성한다.
   //stmt.executeQuery는 괄호 안에 있는 쿼리문을 실행하라는 뜻.
   //실행한 결과를 rs 객체에 넣는다.
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setId(rs.getString(1));
            rest.setName(rs.getString(2));
            rest.setLocation(rs.getString(3));
            rest.setAddress(rs.getString(4));
            rest.setNumber(rs.getInt(5));
            rest.setSalestime(rs.getString(6));
            rest.setClassfy(rs.getString(7));
            rest.setWeather(rs.getString(8));
            rest.setTemperature(rs.getInt(9));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }

}
   
/*
   //장소로만 가게 아이디(메뉴 찾기위함), 가게이름 return
   public ArrayList<Rest> getLocation(String data1, String data2, String data3){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select id, name from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         if (data1 != null && data2 == null && data3 == null) {
            SQL += " where lacation = " + data1;
         }
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setId(rs.getString(1));
            rest.setName(rs.getString(2));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }
   
   // 음식 분류로!
   public ArrayList<Rest> getClassi(String data1, String data2, String data3){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select id, name from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         if (data1 == null && data2 != null && data3 == null) {
            SQL += " where classfy = " + data2;
         }
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
   //결과를 저장하는 객체인 rs 객체를 생성한다.
   //stmt.executeQuery는 괄호 안에 있는 쿼리문을 실행하라는 뜻.
   //실행한 결과를 rs 객체에 넣는다.
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setId(rs.getString(1));
            rest.setName(rs.getString(2));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }
   
   // 날씨에 맞게!!
   public ArrayList<Rest> getWeather(String data1, String data2, String data3){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select id, name from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         if (data1 == null && data2 == null && data3 !=null) {
            SQL += " where weather = " + data3;
         }
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
   //결과를 저장하는 객체인 rs 객체를 생성한다.
   //stmt.executeQuery는 괄호 안에 있는 쿼리문을 실행하라는 뜻.
   //실행한 결과를 rs 객체에 넣는다.
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setId(rs.getString(1));
            rest.setName(rs.getString(2));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }

   //핀 안에서 자세히 보기 눌렀을때, 보여지는 부
   public ArrayList<Rest> getInfo(String data){
      ArrayList<Rest> list = new ArrayList<Rest>();
      String SQL = "select address, number, salestime from Rest";
      try {
         String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
         String dbID = "root";
         String dbPassword = "ehdgH*7958";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
         
         if (data != null) {
            SQL += " where name = " + data;
         }
         pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
         rs = pstmt.executeQuery();
   //결과를 저장하는 객체인 rs 객체를 생성한다.
   //stmt.executeQuery는 괄호 안에 있는 쿼리문을 실행하라는 뜻.
   //실행한 결과를 rs 객체에 넣는다.
         while(rs.next()) {
            Rest rest = new Rest();
            rest.setAddress(rs.getString(1));
            rest.setNumber(rs.getInt(2));
            rest.setSalestime(rs.getString(3));
            list.add(rest);   
         }

      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
            if(conn != null) conn.close();
         } catch(SQLException e) {}
         
            }
      return list;

   }
      
}
*/
/*
public static void main(String[] args) {
   String SQL = "select * from Rest";
   try {
      String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
      String dbID = "root";
      String dbPassword = "ehdgH*7958";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
      rs = pstmt.executeQuery();
//결과를 저장하는 객체인 rs 객체를 생성한다.
//stmt.executeQuery는 괄호 안에 있는 쿼리문을 실행하라는 뜻.
//실행한 결과를 rs 객체에 넣는다.
      System.out.println("NAME" +"\t\t" + "LOCATION" +"\t" + "SAL");//장식용
      System.out.println("===================================");
//장식용
      while(rs.next()) {
//rs 객체는 select * from employes의 결과 레코드를 하나씩 저장한다.
//rs.next()는 다음 레코드를 rs에 저장한다는 뜻이다.
//while(rs.next)는 다음 결과가 null, 즉 존재하지 않을때까지 실행하는 반복문이다.
         String Name = rs.getString("name");
//rs.getString("컬럼명")은 rs결과중 컬럼명을 반환한다.
//즉 위의 결과는 select * from employees 중 컬럼명이 first_name을 반환
         String location = rs.getString("location");
         int sal = rs.getInt("temperature");
//다음과 같이 getInt로 Int형 반환도 가능하다.
         System.out.println(Name +"\t\t" + location + "\t\t" + sal );//결과 출력
         
      }
      rs.close();
      pstmt.close();
      conn.close();//모든 객체를 종료시킨다.

   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
      } catch(SQLException e) {}
      
         }
   }
*/