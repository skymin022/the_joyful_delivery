package DAO;

import java.sql.*;

public class JDBConnection {
	
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://127.0.0.1:3306/delivery?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String id = "mini_team1";
			String pw = "123456";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공");
		} catch(Exception e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
}
