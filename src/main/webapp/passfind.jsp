<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<link rel="stylesheet" href="CSS/passfind.css">
	</head>
	<body>
		<div id="wrap">
			<h1>비밀번호 찾기</h1>
			<form method="post" action="passfind.do">
				<span>가입 아이디 : </span><input type="text" name="id" placeholder="아이디를 입력해주세요">
				<span>가입 이메일 : </span><input type="text" name="email" placeholder="이메일을 입력해주세요">
				<span>가입 연락처 : </span><input type="text" name="phone" placeholder="연락처를 입력해주세요">
				<br>
				<input type="submit" value="비밀번호찾기" id="find">
				<input type="button" value="닫기" id="btn">
				<h3 id="msg"></h3>
				<input type="text" value="${passMsg } ${pass}">
				
				
			</form>
			
		</div>
		<script>
					var find = document.getElementById("find");
					/*find.addEventListener("click",function(){
						var msg = document.getElementById("msg");
						alert("찾으시는 비밀번호는 ");
					})*/
					var closeBtn = document.getElementById("btn");
					closeBtn.addEventListener("click",function(){
						window.close();
					})
				</script>
	</body>
</html>