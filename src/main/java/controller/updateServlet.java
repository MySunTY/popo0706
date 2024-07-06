package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import DTO.Member;
import java.sql.*;

@WebServlet("/update.do")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDAO mDAO = MemberDAO.getInstance();
		String input_id = (String)session.getAttribute("loginUser");
		Member m = mDAO.getMember(input_id);
		session.setAttribute("update",m);
		RequestDispatcher dis = request.getRequestDispatcher("update.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO mDAO = MemberDAO.getInstance();
		String name = request.getParameter("nm");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String id = request.getParameter("id");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update register set name=? , pw=? , email=? , nick=? , phone=? where id=?;";
		
		try {
			conn = mDAO.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name );
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, nick);
			pstmt.setString(5, phone);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("update.do ing error "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("update.do ing error "+ex);
			}
			
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
		
	}

}
