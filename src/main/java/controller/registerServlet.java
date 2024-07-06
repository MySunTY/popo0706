package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


@WebServlet("/register.do")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("agree.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String s_a = request.getParameter("service");
		String p_a = request.getParameter("privacy");
		String e_a = request.getParameter("event");
		request.setAttribute("s_a",s_a);
		request.setAttribute("p_a", p_a);
		request.setAttribute("e_a",e_a );
		
		RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
		dis.forward(request, response);
	}

}
