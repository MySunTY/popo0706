package common;
import java.sql.*;


public class GetConnection {
	public Connection conn = null;
	public Statement stmt = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs= null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/member";
	String db_id = "root";
	String db_pw = "12345678";
	
	public Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,db_id,db_pw);
			
		}catch(Exception e) {
			System.out.println("getConnection ing error"+e);
		}
		
		
		return conn;
		
	}
	
	
	
}//getConnection
