<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index.jsp</title>
		<link rel="stylesheet" href="CSS/index.css">
	</head>
	<body>
		<body>
        <header>
            <h1>
                <!-- <img src=".png" alt="logo" width="30" height="30"> -->
                <a href="index.jsp">원하는 모든것을 관리하세요</a>
            </h1>
            
        </header>
        
        <section>
        <div class="loginForm">
            <form method="post" action="login.do">
            
            <input type="text" name="id" class="textField" placeholder="아이디를 입력하세요" required autocomplete="off">
            <input type="password" name="pw" class="textField" placeholder="비밀번호를 입력하세요" required autocomplete="off">
            <input type="submit" value="로그인" class="submitBtn">
            <div id="or">
            	<hr> 또는 <hr>
            </div>
            
            <div id="other">다른 방법으로 로그인하기</div>
            <div class="newId">
            <a href="register.do">아직 회원이 아니신가요?</a>
            
            </div>
            <div class="newId">
                <a href="#" id="passfind">비밀번호를 잊어버리셨나요?</a>
            </div>
            </form>       
        </div>
        <c:if test="${result==0 }">
        	<script>
        		alert("비밀번호가 틀렸습니다");
        	</script>
        </c:if>
        <c:if test="${result==-1 }">
        	<script>
        		alert("회원가입이 되어있지 않습니다");
        	</script>
        </c:if>
        

        </section>
        <footer>
            <ul>
                <li><a href="#">개발자에게 문의하기</a></li>
                <li><a href="#">이용약관 보기</a></li>
                <li><a href="#">회원 탈퇴</a></li>
                <li><a href="#">이메일 수집 거부</a></li>
                <li><a href="#">개인정보 처리방침</a></li>

            </ul>

        </footer>

	<script>
		let passfind = document.getElementById("passfind");
		let url = "passfind.do"
		passfind.addEventListener("click",function(){
			window.open(url,"_blank_1","width=500 , height=500 , left=100 , top=200");
		});
		
		console.log(${result});
		
	</script>
	</body>
</html>