package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.BoardDAO;
import DTO.BoardDTO;


@WebServlet("/boardUpdate.do")
public class boardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO bDAO = new BoardDAO();
		BoardDTO bDTO = new BoardDTO();
		int num = Integer.parseInt(request.getParameter("num"));
		
		bDTO = bDAO.showBoard(num);
		
		request.setAttribute("updateBoard", bDTO);
		
		request.getRequestDispatcher("board_update.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		
		BoardDAO bDAO = new BoardDAO();
		bDAO.updateBoard(num, title, content, date);
		
		request.getRequestDispatcher("gongji.do?currentPage=1").forward(request, response);
		
		
	}

}
