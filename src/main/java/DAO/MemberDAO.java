package DAO;

import java.sql.*;

import DTO.Member;

public class MemberDAO {
	private MemberDAO() {
		
	}
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Connection conn = null;
		String url = "jdbc:mysql://127.0.0.1:3306/member";
		String db_id ="root";
		String db_pw ="12345678";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		
		
		return conn;
	}
	
	public int loginCheck(String login_id, String login_pw) {
		int result = -1; // -1이면 회원가입안됨 , 회원가입페이지로 보내기 0이면 아이디는있지만 비밀번호틀림, 1은 로그인
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pw from register where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login_id);
			rs  = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pw").equals(login_pw) && rs.getString("pw")!=null) {
					result= 1;
					
				}else {
					result = 0;
				}
				
				
			}else {
				result = -1;
			}
			
		}catch(Exception e) {
			System.out.println("logincheck(id,pw) ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("logincheck(id,pw) end error "+ex);
			}
		}//finally
		
		
		
		return result;
	}
	
	public int checkAdmin(String id) {
		int result = -1; 
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from register where id = ?";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()&& rs.getString("id").equals("admin")) {
				result = 1;
				
			}else {
				result = 0;
			}
			System.out.println("DAO :"+result);
			
		}catch(Exception e) {
			System.out.println("checkAdmin(id) ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("checkAdmin(id) end error "+ex);
			}
		}
		
		
		
		return result;
	}
	
	public int dupleCheck(String id) {
		int result = -1;  //아이디 중복이면 1 중복아니면 -1
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from register where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
			
		}catch(Exception e) {
			System.out.println("dupleCheck(id) ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("dupleCheck(id) end error "+ex);
			}
		}
		
		
		
		
		return result;
	}
	public String findPass(String id , String email, String phone) {
		String result= "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pw from register where id=? and email=? and phone=?;";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			if(rs.next()) {
				result = rs.getString("pw");
			}else {
				result = "잘못 입력하셨습니다";
			}
			
			
		}catch(Exception e) {
			System.out.println("findPass(id,email,phone) ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("findPass(id,email,phone) end error" +ex);
			}
		}
		
		
		return result;
	}
	
	public Member getMember(String id) {
		Member m = new Member();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from register where id = ?;";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				m.setId(rs.getString("id"));
				m.setName(rs.getString("name"));
				m.setPw(rs.getString("pw"));
				m.setEmail(rs.getString("email"));
				m.setNick(rs.getString("nick"));
				m.setPhone(rs.getString("phone"));
			}
			
			
		}catch(Exception e) {
			System.out.println("getMember(id) ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("getMember(id) end error "+ex);
			}
		}
		
		
		
		
		
		
		return m;
	}
	
	
	
}
