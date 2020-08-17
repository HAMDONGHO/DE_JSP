package jsp.eatday.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt = null;

	public int join(User user) {
		try {
			 String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
	         String dbID = "root";
	         String dbPassword = "ehdgH*7958";
	         Class.forName("com.mysql.jdbc.Driver");
	         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	         
	         pstmt = conn.prepareStatement("insert into User(id, password, email, phone, name, year, month, day, sex) VALUES (?,?,?,?,?,?,?,?,?)");
	         pstmt.setString(1, user.getId());
	         pstmt.setString(2, user.getPassword());
	         pstmt.setString(3, user.getEmail());
	         pstmt.setInt(4, user.getPhone());
	         pstmt.setString(5, user.getName());
	         pstmt.setInt(6, user.getYear());
	         pstmt.setInt(7,  user.getMonth());
	         pstmt.setInt(8, user.getDay());
	         pstmt. setString(9, user.getSex());
				
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
	
	public int login(String id, String password) {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
			String dbID = "root";
			String dbPassword = "ehdgH*7958";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	         
			pstmt = conn.prepareStatement("select password from User where id = ?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1;
				} else {
					return 0;
				}	
			}
			return -1;
			
			} catch (Exception e) {
			e.printStackTrace();
			
			}finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
			if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
			}
		return -2; 
	}
}
