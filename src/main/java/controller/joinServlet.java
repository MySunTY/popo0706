package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import DAO.MemberDAO;
import java.sql.*;

@WebServlet("/join.do")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("nm");
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		String tongsinsa = request.getParameter("tongsinsa");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String s_a = request.getParameter("s_a");
		String p_a = request.getParameter("p_a");
		String e_a = request.getParameter("e_a");
		
		MemberDAO mDAO = MemberDAO.getInstance();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into register(id, pw, name, email, nick , tongsinsa, phone, birth , s_a, p_a, e_a)";
		sql += "values (?,?,?,?,?,?,?,?,?,?,?);";
		
		try {
			conn = mDAO.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, nick);
			pstmt.setString(6, tongsinsa);
			pstmt.setString(7, phone);
			pstmt.setString(8, birth);
			pstmt.setString(9, s_a);
			pstmt.setString(10, p_a);
			pstmt.setString(11, e_a);
			
			pstmt.execute();
			
			RequestDispatcher dis = request.getRequestDispatcher("welcome.jsp");
			dis.forward(request, response);
			
			
		}catch(Exception e) {
			System.out.println("join.do ing error "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("join.do end error "+ex);
			}
		}
		
		
		
	}

}
