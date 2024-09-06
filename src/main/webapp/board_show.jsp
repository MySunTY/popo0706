<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 보기</title>
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
			<h1>게시글 보기</h1>
			<table>
				<tr>
					<th>게시글 번호</th>
					<td id="content">${showOne.num }</td>
				</tr>
				<tr>
					<th>게시글 제목</th>
					<td>${showOne.title }</td>
				</tr>
				<tr id="con1">
					<th>게시글 내용</th>
					<td>${showOne.content }</td>
				</tr>
				<tr>
					<th>작성일자</th>
					<td>${showOne.date }</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="pass"></td>
				</tr>
				<tr>
					<th>hidden</th>
					<td><input type="text" value="${showOne.pwd }" id="passcheck"></td>
				</tr>
			</table>
			<div id="btns">
				<button onclick="location.href='gongji.do?currentPage=1'">목록보기</button>
				<button id="updateBtn">수정하기</button>
				<button id="deleteBtn">삭제하기</button>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>		
			<script>
				let pass = document.getElementById("pass");
				let passCheck = document.getElementById("passcheck");
				/*function passC(){
					if(pass.value != passCheck.value){
						alert("비밀번호를 확인해주세요");
					}
					return false;
				}*/
				let updateBtn = document.getElementById("updateBtn");
				
				function passCheckUpdate(){
					if(pass.value != passCheck.value){
						alert("비밀번호를 확인해주세요");
					}else{
						location.href="boardUpdate.do?num=${showOne.num}";	
					}
					
				}
				function passCheckDelete(){
					if(pass.value != passCheck.value){
						alert("비밀번호를 확인해주세요");
					}else{
						alert("정상적으로 삭제되었습니다 게시글 목록으로 이동합니다");
						location.href='boardDeleteOne.do?num=${showOne.num}';	
					}
					
				}
				
				updateBtn.addEventListener("click",passCheckUpdate);
				
				let deleteBtn = document.getElementById("deleteBtn");
				deleteBtn.addEventListener("click",passCheckDelete);
				
			</script>
		</div>
		
	</body>
</html>