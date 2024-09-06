package DAO;
import java.util.*;
import common.GetConnection;
import java.sql.*;
import DAO.MemberDAO;
import DTO.BoardDTO;


public class BoardDAO {
	
	public List<BoardDTO> getList(int currentPage) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		GetConnection getConn = new GetConnection();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int start = (currentPage*10-10);
		
		String sql = "select * from board order by num desc limit ? ,10 ";		
		
		
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bDTO = new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setId(rs.getString("id"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getString("write_date"));
				bDTO.setSubject(rs.getInt("subject"));
				list.add(bDTO);
				
			}
			
			
			
		}catch(Exception e) {
			System.out.println("getList() ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("getList() end error "+ex);
			}
		}
		
		
		
		return list;
	}//getlist
	
	public int getPage() {
		
		GetConnection getConn = new GetConnection();
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from board;";
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
		}catch(Exception e) {
			System.out.println("getPage Ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("getPage end error "+ex);
			}
		}
		
		
		
		
		
		return result;
	}//getPage
	
	public void deleteBoard(String[] num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from board where num = ?";
		GetConnection getConn = new GetConnection();
		
		try {
			
			for(int i = 0 ; i<num.length ; i++) {
				conn = getConn.getConn();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num[i]);
				pstmt.executeUpdate();
				
			}
			
			
		}catch(Exception e) {
			System.out.println("deleteBoard ing error "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("deleteBoard end error"+ex);
			}
		}
		
	}//deleteBoard
	
	public List<BoardDTO> adminList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		GetConnection getConn = new GetConnection();
		
		String sql = "select * from board where id='admin';";
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bDTO = new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setId(rs.getString("id"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getString("write_date"));
				list.add(bDTO);
			}
			
		}catch(Exception e) {
			System.out.println("adminList ing error"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("adminList end error"+ex);
			}
		}
		
		
		
		
		
		
		return list;
	}//adminList
	
	public BoardDTO showBoard(int num) {
		GetConnection getConn = new GetConnection();
		BoardDTO bDTO = new BoardDTO();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "select * from board where num = ?;";
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				bDTO.setNum(rs.getInt("num"));
				bDTO.setId(rs.getString("id"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getString("write_date"));
				bDTO.setPwd(rs.getString("pwd"));
				
			}
			
		}catch(Exception e) {
			System.out.println("showBoard ing error"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("showBoard end error"+ex);
			}
		}
		
		
		return bDTO;
	}//showBoard
	
	
	public void updateBoard(int num , String title , String content , String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		GetConnection getConn = new GetConnection();
		String sql = "update board set title=? , content=? , write_date = ? where num = ?;";
		
		try {
			conn= getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, date);
			pstmt.setInt(4, num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("updateBoard ing error"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("updateBoard end error"+ex);
			}
		}
		
	}//updateBoard
	
	public void deleteBoardOne(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		GetConnection getConn = new GetConnection();
		String sql="delete from board where num =?;";
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("deleteBoardOne ing error"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("deleteBoardOne end error"+ex);
			}
		}
		
	}
	
	
	
	
	
	
}//BoardDAO 
