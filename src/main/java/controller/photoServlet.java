package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import DTO.PhotoDTO;
import DAO.PhotoDAO;
import java.util.*;


@WebServlet("/photo.do")
public class photoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PhotoDAO pDAO = new PhotoDAO();
		PhotoDTO pDTO = new PhotoDTO();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int photoNpage = pDAO.photoNpage();
		int nPage = 0;
		if(photoNpage %6== 0) {
			nPage = photoNpage/6;
		}else {
			nPage = photoNpage/6 +1;
		}
		request.setAttribute("photoNpage", nPage);
		
		
		
		List<PhotoDTO> list = pDAO.getPhotoList(currentPage);
		request.setAttribute("photoList", list);
		
		
		request.getRequestDispatcher("photo.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ServletContext context= getServletContext();
		String path = context.getRealPath("/img");
		
		String encType = "utf-8";
		int limitSize = 20*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, path, limitSize , encType , new DefaultFileRenamePolicy());
		String writer = multi.getParameter("writer");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String photo = multi.getFilesystemName("photo");
		
		PhotoDTO pDTO = new PhotoDTO();
		pDTO.setWriter(writer);
		pDTO.setTitle(title);
		pDTO.setContent(content);
		pDTO.setPhoto("/img/"+photo);
		
		
		
		
		PhotoDAO pDAO = new PhotoDAO();
		pDAO.insertPhoto(pDTO);
		
		request.getRequestDispatcher("photo_upload.jsp").forward(request,response);
		
		
		
		
	}

}
