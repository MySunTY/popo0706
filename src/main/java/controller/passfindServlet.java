package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import DAO.MemberDAO;


@WebServlet("/passfind.do")
public class passfindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		RequestDispatcher dis = request.getRequestDispatcher("passfind.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("passfindServlet doPost");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		MemberDAO mDAO = MemberDAO.getInstance();
		
		String findPass = mDAO.findPass(id,email,phone);
		String str = "찾으시는 비밀번호는 : ";
		System.out.println(findPass);
		request.setAttribute("pass", findPass);
		request.setAttribute("passMsg", str);
		RequestDispatcher dis = request.getRequestDispatcher("passfind.jsp");
		dis.forward(request,response);
		
		
		
		
		
		
	}
	

}
