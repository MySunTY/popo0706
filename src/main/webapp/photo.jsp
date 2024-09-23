<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Photo</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
		<style>
			#wrap{
				text-align: center;
			}
			
			
			img{
				width: 200px;
				height : 200px;
			}
			#photoShow{
				width: 80%;
				margin: auto;
			}
			.photoPan{
				display: inline-block;
				margin: 10px 20px;
				
			}
			button{
				width: 100px;
				height: 50px;
				
			}
			.imgs{
				width: 100px;
				height: 50px;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<h1>포토 게시판</h1>
			<button onclick="location.href='photo_upload.jsp'">사진 올리기</button>
			<div id="photoShow">
				
				 
				 <c:forEach var="i" items="${photoList }">
				 	<div class="photoPan">
				 		<div class="photoTitle">${i.title }</div>
				 		<div class="photo"><img src=".${i.photo }"></div>
				 	</div>
				 </c:forEach>
			</div>
			<c:forEach begin="1" end="${photoNpage }" var="i">
				<a href="photo.do?currentPage=${i }">[${i }]</a>
			</c:forEach>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		
	</body>
</html>