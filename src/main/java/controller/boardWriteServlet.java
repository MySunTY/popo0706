package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DTO.BoardDTO;
import DAO.MemberDAO;
import java.sql.*;
import DAO.BoardDAO;
import java.util.*;

@WebServlet("/write.do")
public class boardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("board_write.jsp");
		dis.forward(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDTO bDTO = new BoardDTO();
		MemberDAO mDAO = MemberDAO.getInstance();
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd= request.getParameter("pwd");
		String date = request.getParameter("date");
		HttpSession session = request.getSession();
		
		bDTO.setId(id);
		bDTO.setTitle(title);
		bDTO.setContent(content);
		bDTO.setPwd(pwd);
		bDTO.setDate(date);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into board(id,title,content,write_date,pwd) values(?,?,?,?,?);";
		
		try {
			conn = mDAO.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, date);
			pstmt.setString(5, pwd);
			
			pstmt.execute();
			/*BoardDAO bDAO = new BoardDAO();
			List<BoardDTO> list = new ArrayList<BoardDTO>();
			list = bDAO.getList();
			request.setAttribute("boardList", list);
			*/
			
			response.sendRedirect("main.jsp");
			
		}catch(Exception e) {
			System.out.println("write.do ing error "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("write.do end error "+ex);
			}
			
		}
		
		
		
	}

}
