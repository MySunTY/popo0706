<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 비밀번호 확인</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
		<style>
			h1{
				text-align : center;
			}
			table{
				border-collapse : collapse;
				width: 80%;
				margin: auto;
				height: 500px;
				text-align : center;
			}
			th,td{
				border : 1px solid black;
			}
			#content{
				width: 80%;
			}
			#con1{
				height: 70%;
			}
			button{
				margin: 30px;
				width: 100px;
				height : 30px;
			}
			#btns{
				display : flex;
				justify-content : center;
				align-items : center;
				
			}
		</style>
	</head>
	<body>
		<div id="wrap">
		
		
			<jsp:include page="header.jsp"></jsp:include>
			<h1>게시글 수정하기</h1>
			<form method="post" action="boardUpdate.do" id="frm">
			<table>
				<tr>
					<th>게시글 번호</th>
					<td id="content"><input type="text" value="${showOne.num }" name="num" readonly></td>
				</tr>
				<tr>
					<th>게시글 제목</th>
					<td><input type="text" name="title" value="${showOne.title }"></td>
				</tr>
				<tr id="con1">
					<th>게시글 내용</th>
					<td><textarea rows="10" cols="50" name="content">${showOne.content }</textarea></td>
				</tr>
				<tr>
					<th>수정일자</th>
					<td><input type="text" id="updateDate" name="date" ></td>
				</tr>
				
			</table>
			</form>
			<div id="btns">
				<button onclick="location.href='gongji.do?currentPage=1'">목록보기</button>
				<button id="updateBtn">수정하기</button>
				<button id="deleteBtn">삭제하기</button>
			</div>
			
		
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
		<script>
			let date = new Date();
			let year = date.getFullYear();
			let month = (date.getMonth())+1;
			if(month<10){
				month = "0"+month;
			}
			
			let day = date.getDate();
			if(day<10){
				day = "0"+day;
			}
			
			let today = year+"-"+month+"-"+day;
			let frm = document.getElementById("frm");
			
			
			let updateDate = document.getElementById("updateDate");
			updateDate.value = today;
			let updateBtn = document.getElementById("updateBtn");
			updateBtn.addEventListener("click",function(){
				frm.submit();
			});
			
			let deleteBtn = document.getElementById("deleteBtn");
			deleteBtn.addEventListener("click",function (){
				
					alert("정상적으로 삭제되었습니다 게시글 목록으로 이동합니다");
					location.href='boardDeleteOne.do?num=${showOne.num}';	
				
				
			});
			
		</script>
	</body>
</html>