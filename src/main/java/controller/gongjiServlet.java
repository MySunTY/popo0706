package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DTO.BoardDTO;
import DAO.BoardDAO;
import java.util.*;



@WebServlet("/gongji.do")
public class gongjiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		BoardDAO bDAO = new BoardDAO();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		List<BoardDTO> list = bDAO.getList(currentPage);
		List<BoardDTO> adminList = bDAO.adminList();
		int nPage = bDAO.getPage();
		int showPage = 0;
		if(nPage% 10 ==0) {
			showPage = nPage/10;
		}else {
			showPage = nPage/10 +1;
		}
		HttpSession session = request.getSession();
		
		
		session.setAttribute("boardList", list);
		session.setAttribute("nPage",nPage);
		session.setAttribute("showPage", showPage);
		session.setAttribute("adminList",adminList);
		
		
		request.getRequestDispatcher("gongji.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDAO bDAO = new BoardDAO();
		int currentPage = 1;
		
		List<BoardDTO> list = bDAO.getList(currentPage);
		List<BoardDTO> adminList = bDAO.adminList();
		int nPage = bDAO.getPage();
		int showPage = 0;
		if(nPage% 10 ==0) {
			showPage = nPage/10;
		}else {
			showPage = nPage/10 +1;
		}
		HttpSession session = request.getSession();
		
		
		session.setAttribute("boardList", list);
		session.setAttribute("nPage",nPage);
		session.setAttribute("showPage", showPage);
		session.setAttribute("adminList",adminList);
		
		
		request.getRequestDispatcher("gongji.jsp").forward(request, response);
	}

}
