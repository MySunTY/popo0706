<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입완료</title>
	</head>
	<body>
		<h1>회원이 되신걸 진심으로 환영합니다</h1>
		<input type="button" value="로그인하러가기">
		
		<script>
			var inputs = document.getElementsByTagName("input")[0];
			inputs.addEventListener("click",function(){
				location.href="login.do";	
			})
		</script>
	</body>
</html>