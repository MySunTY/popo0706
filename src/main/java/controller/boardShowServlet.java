package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DTO.BoardDTO;
import DAO.BoardDAO;


@WebServlet("/boardShow.do")
public class boardShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = new BoardDTO();
		bDTO = bDAO.showBoard(num);
		
		HttpSession session = request.getSession();
		session.setAttribute("showOne", bDTO);
		
		request.getRequestDispatcher("board_show.jsp").forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
