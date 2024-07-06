package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;



@WebServlet("/confirm")
public class confirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String confirmId = request.getParameter("id");
		MemberDAO mDAO = MemberDAO.getInstance();
		int result = mDAO.dupleCheck(confirmId);
		session.setAttribute("result", result);
		System.out.println(result);
		var resultNum = result;
		var msg ="사용가능한 아이디입니다";
		if(result==1) {
			msg="중복된 아이디입니다";
		}
		PrintWriter out = response.getWriter();
		out.println("<response>");
		out.println("<message>");
		out.println(msg);
		out.println("</message>");
		out.println("<result>");
		out.println(resultNum);
		out.println("</result>");
		out.println("</response>");
		System.out.println(msg);
		System.out.println(resultNum);
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
