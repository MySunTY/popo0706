<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<style>
			
			*{
				text-decoration : none;
			}
			#wrap{
				text-align : center;
				width: 800px;
			}
			th,td{
				border :1px solid gray;
				border-collapse : collapse;
			}
			
			table{
				width: 80%;
				margin :auto;
				border-collapse : collapse;
			}
			#title{
				width: 50%;
			}
			
			h1{
				text-align : center;
			}
			.imgs{
				width: 100px;
				height: 50px;
			}
			
			
			
		</style>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<h1>공지사항</h1>
			<form method="post" action="boardDelete.do">
			<table>
					
					<tr>
						<th>글 번호</th>
						<th id="title">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제</th>
						
					</tr>
					<c:forEach var="a" items="${adminList }">
						<tr>
							<th>${a.num }</th>
							<th><a href="boardShow.do?num=${a.num }">${a.title }</a></th>
							<th>${a.id }</th>
							<th>${a.date }</th>
							<th><input type="checkbox" id="del" name="dels" value="${a.num }"></th>
							
						</tr>
					</c:forEach>
					
					<c:forEach var="i" items="${boardList }">
						<tr>
							<td>${i.num }</td>
							<td><a href="boardShow.do?num=${i.num }">${i.title }</a></td>
							<td>${i.id }</td>
							<td>${i.date }</td>
							<td><input type="checkbox" id="del" name="dels" value="${i.num }"></td>
							
						</tr>
					
					</c:forEach>
						
					
				
					
					</table>
					<c:forEach begin="1" end="${showPage }" var="i">
						<a href="gongji.do?currentPage=${i }">[${i }]</a>
					</c:forEach>
					<h2>전체페이지 게시글수 : ${nPage }</h2>
					<h2>전체페이지 수 : ${showPage }</h2>
					<a href="write.do">글쓰기</a>
					<input type="submit" value="삭제">
					</form>
					<jsp:include page="footer.jsp"></jsp:include>
			</div>
			
			<script>
				
			</script>
		
	</body>
</html>