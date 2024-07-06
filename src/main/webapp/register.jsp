<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입페이지</title>
		<link rel="stylesheet" href="CSS/insert.css">
	</head>
	<body>
		<div id="wrap">
			<h1>회원 가입 정보를 입력하세요</h1>
			<form method="post" action="join.do" id="form">
			<div>
				
				<span>아이디</span><input type="text" name ="id" placeholder="아이디를 입력하세요" required class="inputs" id="id">
				<input type="hidden" name="reId" id="reId">
				<div id="overlap" onclick="confirmId()">아이디 중복체크</div>
				<div id="confirm">
					<span id="confirmMsg">중복체크를 해주세요</span>
				</div>
				
				<span>비밀번호</span><input type="password" id="pwd" name="pw" placeholder="비밀번호를 입력하세요" required class="inputs">
				<span>비밀번호확인</span><input type="password" id="pwd_check" placeholder="비밀번호를 다시한번 입력해주세요" class="inputs">
				<span>이름</span><input type="text" name="nm" placeholder="이름을 입력하세요" required class="inputs">
				<span>이메일</span><input type="text" name="email" placeholder="이메일 주소를 입력하세요" required class="inputs">
				<span>닉네임</span><input type="text" name="nick" placeholder="활동명을 입력해주세요" required class="inputs">
				<span>전화번호</span>
				<select name="tongsinsa">
					<option>SK</option>
					<option>KT</option>
					<option>LG</option>
					<option>Other</option>						
				</select>
				<input type="text" name="phone" placeholder="01012345678" required id="ph">
				<span>생년월일</span><input type="text" name="birth" placeholder="생년월일 6자리 ex)980506" required class="inputs">
				<input type="text" name="s_a" value="${s_a }">
				<input type="text" name="p_a" value="${p_a }">
				<input type="text" name="e_a" value="${e_a }">
				<div class="gaip">
				<input type="submit" value="가입하기" onclick="return regiCheck()">
				
				
				</div>
			</div>
			</form>
		</div>
		<script>
			
		
			let confirmBtn = document.getElementById("overlap");
			let confirmMsg = document.getElementById("confirmMsg");
			let forms = document.getElementById("form");
			let ids = document.getElementById("id");
			let reids= document.getElementById("reId");
			let inputs = document.getElementsByClassName("inputs");
			let pwd = document.getElementById("pwd");
			let pwd_check = document.getElementById("pwd_check");
			
			/*confirmBtn.addEventListener("click",function(){
				
				forms.action ="overlap.jsp";
				if(ids.value !=""){
					forms.submit();	
					
					
					
				}else{
					alert("아이디를 입력해주세요");
				}
			});*/
			
			
			
			var XHR;
			function createXHR(){
				if(window.ActiveXObject){
					XHR = new ActiveXObject('Microsoft.XMLHTTP');
				}else if(window.XMLHttpRequest){
					XHR = new XMLHttpRequest();
				}
			}
			
			function confirmId(){
				createXHR();
				let msg = document.getElementById("id").value;
				XHR.onreadystatechange = handleStateChange;
				var url = "confirm?id="+msg;
				XHR.open("get",url,true);
				XHR.send(null);
				
			}
			
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status=200){
						var dupleMsg = XHR.responseXML.getElementsByTagName("message")[0].firstChild.data;
						var resultNum = XHR.responseXML.getElementsByTagName("result")[0].firstChild.data;
						console.log(dupleMsg);
						console.log(resultNum);
						confirmMsg.innerHTML = dupleMsg;
						if(resultNum==-1){
							reids.value = ids.value;
						}
						
						
					}
				}
			}
			
				
			function regiCheck(){
				if(reids.value!=ids.value){
					alert("아이디 중복체크해주세요");
					ids.focus();
					return false;
				}
				if(pwd.value!= pwd_check.value){
					alert("비밀번호확인해주세요");
					pwd.focus();
					return false;
				}
				
				
				
				
				return true;
			}
			
			
			
			
		</script>
	</body>
</html>