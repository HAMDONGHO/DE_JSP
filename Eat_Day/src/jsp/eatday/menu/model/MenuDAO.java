package jsp.eatday.menu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MenuDAO {
	//dao는 데이터베이스 접근 객체의 약자
	//실제 db에서 Menu정보 불러올때
	
	private Connection conn; // connection:db에 접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//mysql 접속
	public MenuDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Menu";
			String dbID = "root@localhost";
			String dbPassword = "ehdgH*7958";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace(); //오류가 무엇인지?
		}
	}
}
