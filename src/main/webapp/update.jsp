<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
		<style>
			form{
				width: 600px;
				margin: auto;
			}
			#wrap{
				text-align : center;
			}
			span{
				display: inline-block;
				width: 80px;
			}
			.inputs{
				width: 350px;
				height: 40px;
				
				margin: 20px;
				
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
		
			<h1>회원정보수정</h1>
		<form method="post" action="update.do">
			<span>아이디 : </span>
			<input type="text" name="id" value="${update.id}" readonly class="inputs"><br>
			<span>이름 : </span>
			<input type="text" name="nm" value="${update.name }" class="inputs"><br>
			<span>비밀번호 : </span>
			<input type="password" name="pw" value="${update.pw }" class="inputs"><br>
			<span>이메일 : </span>
			<input type="text" name="email" value="${update.email }" class="inputs"><br>
			<span>닉네임 : </span>
			<input type="text" name="nick" value="${update.nick }" class="inputs"><br>
			<span>전화번호 :</span>
			<input type="text" name="phone" value="${update.phone }" class="inputs"><br>
			<input type="submit" value="정보수정" id="sub" class="btn">
			<input type="reset" value="초기화" class="btn">
		</form>
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
		
		<script>
			let sub = document.getElementById("sub");
			sub.addEventListener("click",function(){
				alert("정보수정이 완료되었습니다");
			})
		</script>
	</body>
</html>