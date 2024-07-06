<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main.jsp</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
	</head>
	<body>
		
		<div id="wrap">
			<div id=header>
				<header>
				            <h1>
				                <img src="" alt="logo" width="30" height="30">
				                <a href="index.jsp">원하는 모든것을 관리하세요</a>
				            </h1>
				            
				 </header>
		
				<nav>
	            <ul>
	                <li><a href="main.jsp">Home</a></li>
	                <li><a href="#">How to Use</a></li>
	                <li><a href="#">MyPage</a></li>
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
			<h1>${sessionScope.grade }</h1>
			<h1>${sessionScope.loginUser }</h1>
			
		
		
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		
		<script>
			let out = document.getElementById("out");
			out.addEventListener("click",function(){
				alert("로그아웃 되었습니다");
			})
		</script>
	</body>
</html>