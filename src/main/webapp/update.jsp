<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<link rel="stylesheet" href="CSS/header.css">
	</head>
	<body>
		<div id="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		
			<h1>회원정보수정</h1>
		<form method="post" action="update.do">
			<span>아이디 : </span>
			<input type="text" name="id" value="${update.id}" readonly>
			<span>이름 : </span>
			<input type="text" name="nm" value="${update.name }">
			<span>비밀번호 : </span>
			<input type="password" name="pw" value="${update.pw }">
			<span>이메일 : </span>
			<input type="text" name="email" value="${update.email }">
			<span>닉네임 : </span>
			<input type="text" name="nick" value="${update.nick }">
			<span>전화번호 :</span>
			<input type="text" name="phone" value="${update.phone }">
			<input type="submit" value="정보수정" id="sub">
		</form>
		</div>
		
		<script>
			let sub = document.getElementById("sub");
			sub.addEventListener("click",function(){
				alert("정보수정이 완료되었습니다");
			})
		</script>
	</body>
</html>