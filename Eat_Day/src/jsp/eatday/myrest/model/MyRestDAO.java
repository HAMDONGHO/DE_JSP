package jsp.eatday.myrest.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyRestDAO {

	   Connection conn=null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   //Statement stmt = null;
	   
		public int insert(MyRest myrest) {
			try {
				 String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
		         String dbID = "root";
		         String dbPassword = "ehdgH*7958";
		         Class.forName("com.mysql.jdbc.Driver");
		         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		         		         
		         pstmt = conn.prepareStatement("insert into MyRest(user_id, rest_id, rest_name, rest_location, rest_address, rest_number, rest_salestime, rest_classfy, rest_rep, rest_latitude, rest_longitude) values(?,?,?,?,?,?,?,?,?,?,?)");
		         pstmt.setString(1, myrest.getUser_id());
		         pstmt.setString(2, myrest.getRest_id());
		         pstmt.setString(3, myrest.getRest_name());
		         pstmt.setString(4, myrest.getRest_location());
		         pstmt.setString(5, myrest.getRest_address());
		         pstmt.setString(6, myrest.getRest_number());
		         pstmt.setString(7, myrest.getRest_salestime());
		         pstmt.setString(8, myrest.getRest_classfy());
		         pstmt.setString(9, myrest.getRest_rep());
		         pstmt.setFloat(10, myrest.getRest_latitude());
		         pstmt.setFloat(11, myrest.getRest_longitude());
					
		         return pstmt.executeUpdate();
		         
		         }catch(Exception e) {
		        	 e.printStackTrace();
		         
		      }finally{
		    	  if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
		    	  if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
		    	  if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
		    	  }
			return -1;
			}
		
		public ArrayList<MyRest> getinfo(String user_id){
			ArrayList<MyRest> list = new ArrayList<MyRest>();
			String SQL = "select rest_id, rest_name, rest_location, rest_address, rest_number, rest_salestime, rest_classfy, rest_rep, rest_latitude, rest_longitude from MyRest where user_id = '"+user_id+"'";
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
			            MyRest myrest = new MyRest();
			            myrest.setRest_id(rs.getString(1));
			            myrest.setRest_name(rs.getString(2));
			            myrest.setRest_location(rs.getString(3));
			            myrest.setRest_address(rs.getString(4));
			            myrest.setRest_number(rs.getString(5));
			            myrest.setRest_salestime(rs.getString(6));
			            myrest.setRest_classfy(rs.getString(7));
			            myrest.setRest_rep(rs.getString(8));
			            myrest.setRest_latitude(rs.getFloat(9));
			            myrest.setRest_longitude(rs.getFloat(10));
			            list.add(myrest);   
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
