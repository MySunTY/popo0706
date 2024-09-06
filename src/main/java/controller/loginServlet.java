package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import DAO.BoardDAO;
import java.util.*;
import DTO.BoardDTO;


@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String login_id = request.getParameter("id");
		String login_pw = request.getParameter("pw");
		MemberDAO mDao = MemberDAO.getInstance(); 
		HttpSession session = request.getSession();
		int result = mDao.loginCheck(login_id,login_pw);
		int adminCheck = mDao.checkAdmin(login_id);
		System.out.println("login :"+adminCheck);
		if(adminCheck==1) {
			
			session.setAttribute("grade", "관리자");
		}else if(adminCheck==0) {
			
			session.setAttribute("grade", "일반회원");
		}
		
		if(result==1) {
			session.setAttribute("result", result);
			
			session.setAttribute("loginUser", login_id);
			
			
			
			
			
			
			
			
			
			
			RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
			dis.forward(request, response);
			
		}else if(result==0) {
			request.setAttribute("result",result);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
			
		}else if(result==-1) {
			request.setAttribute("result", result);
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
			
		}
		
		
		
		
	}

}
