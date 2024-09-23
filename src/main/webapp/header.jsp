<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id=header>
	<header>
	            <h1>
	                <img src="img/pngwing.com-35.png" alt="logo" class="imgs" width="100" height="50">
	                <a href="main.jsp">원하는 모든것을 관리하세요</a>
	            </h1>
	            
	 </header>
		
			<nav>
	            <ul>
	                <li><a href="main.do">Home</a></li>
	                <li><a href="gongji.do?currentPage=1">Notice</a></li>
	                <li><a href="photo.do?currentPage=1">Photo</a></li>
	                <li><a href="update.do">회원정보수정</a></li>
	                <c:if test="${grade=='관리자'}">
						<li>
							<a href="show.do">관리자 메뉴</a>
						</li>
					</c:if>
					
					
					<li><a href="out.do" id="out">LogOut</a></li>
	
	            </ul>
	
	        </nav>
</div>