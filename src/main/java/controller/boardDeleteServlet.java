package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.BoardDAO;



@WebServlet("/boardDelete.do")
public class boardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] num = request.getParameterValues("dels");
		BoardDAO bDAO = new BoardDAO();
		
		
		bDAO.deleteBoard(num);
		
		request.getRequestDispatcher("gongji.do").forward(request, response);
		
		
		
	}

}
