package DAO;
import common.GetConnection;
import DTO.PhotoDTO;
import java.util.*;
import java.sql.*;


public class PhotoDAO {
	public void insertPhoto(PhotoDTO pDTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into photo(writer, title, content, photo, upload_date) values(?,?,?,?,now());";
		GetConnection getConn = new GetConnection();
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pDTO.getWriter());
			pstmt.setString(2, pDTO.getTitle());
			pstmt.setString(3, pDTO.getContent());
			pstmt.setString(4, pDTO.getPhoto());
			
			pstmt.execute();
			
		}catch(Exception e) {
			System.out.println("insertPhoto ing error "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("insertPhoto end error "+ex);
			}
		}
		
	}// insertPhoto
	
	public List<PhotoDTO> getPhotoList(int currentPage) {
		List<PhotoDTO> list = new ArrayList<PhotoDTO>();
		GetConnection getConn = new GetConnection();
		int start = (currentPage-1)*6;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select * from photo order by num desc limit ?,6;";
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PhotoDTO pDTO = new PhotoDTO();
				pDTO.setNum(rs.getInt("num"));
				pDTO.setTitle(rs.getString("title"));
				pDTO.setContent(rs.getString("content"));
				pDTO.setPhoto(rs.getString("photo"));
				pDTO.setUpload_date(rs.getString("upload_date"));
				list.add(pDTO);
			}
			
		}catch(Exception e) {
			System.out.println("getPhoto ing error"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("getPhoto end error" +ex);
			}
		}
		
		
		
		
		return list;
	}// getPhotoList
	
	public int photoNpage() {
		int result = 0;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql ="select count(*) from photo;";
		GetConnection getConn = new GetConnection();
		
		try {
			conn = getConn.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("photoNpage ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("photoNapge end error "+ex);
			}
		}
		
		
		
		return result;
		
	}
}
