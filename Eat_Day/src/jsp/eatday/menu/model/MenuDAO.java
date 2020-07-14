package jsp.eatday.menu.model;

import java.sql.*;
import java.util.*;

public class MenuDAO {
	//dao는 데이터베이스 접근 객체의 약자
	//실제 db에서 Menu정보 불러올때
	
	static Connection conn=null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	static Statement stmt = null;
	
	public ArrayList<Menu> Menu(String data){
		ArrayList<Menu> list = new ArrayList<Menu>();
		String SQL = "select manunum, menuname, price from menu";
		try {
			String dbURL = "jdbc:mysql://localhost:3306/eat_day?serverTimezone=Asia/Seoul&useSSL=false";
			String dbID = "root";
			String dbPassword = "ehdgH*7958";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			if (data != null) {
				SQL += " where id = " + data;
			}
			pstmt = conn.prepareStatement(SQL); //연결객체와 statement 객체 결합
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Menu rest = new Menu();
				rest.setMenunum(rs.getInt(1));
				rest.setMenuname(rs.getString(2));
				rest.setPrice(rs.getInt(3));
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
