<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약관 동의 여부</title>
		<link rel="stylesheet" href="CSS/agree.css">
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
	
		
		<div id="wrap">
			<div class="headline">
				<h1>약관 동의 페이지</h1>
			</div>
			
			<form method="post" action="register.do">
				<div id="allcheck">
				전체동의하기
				</div>
				<p>본 동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며, 개별적으로 동의를 선택하실 수 있습니다.<br>
				선택약관에 동의하지 않으시더라도 서비스 이용할 수 있습니다.</p>
				<input type="checkbox" id="c1" class="check" required><small>[필수]</small>서비스 이용약관<br>
					<textarea rows="7" cols="80" readonly>
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
					</textarea><br>
				<input type="checkbox" id="c2" class="check" required><small>[필수]</small>개인정보 수집 및 이용<br>
					<textarea rows="7" cols="80" readonly>
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
					</textarea><br>
					<input type="checkbox" id="c3" class="check"><small>[선택]</small>이벤트 혜택 수집 및 이용<br>
					<textarea rows="7" cols="80" readonly>
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
						저희의 서비스를 이용해주셔서 감사합니다. 앞으로도 저 멋진 서비스로 보답하겠습니다. 약관에 동의하시면 체크박스에 선택해주세요 감사합니다.
					</textarea><br>
					<input type="text" id="h1" class="hid" value="false" name="service">
					<input type="text" id="h2" class="hid" value="false" name="privacy">
					<input type="text" id="h3" class="hid" value="false" name="event">
				<input type="submit" value="다음" id="next" onclick="return agreeCheck()">
				
			</form>
		</div>
		<script>
			let allcheck = document.getElementById("allcheck");
			let checks = document.getElementsByClassName("check");
			let hids = document.getElementsByClassName("hid");
			allcheck.addEventListener("click",function(){
				for(let i = 0 ; i<checks.length; i++){
					checks[i].setAttribute("checked",true);
					
					
				}
			});
			
			$(function(){
				$("#allcheck").click(function(){
					$("#h1").val($("#c1").prop("checked"));
					$("#h2").val($("#c2").prop("checked"));
					$("#h3").val($("#c3").prop("checked"));
				})
				
				
				
				$("#c1").change(function(){
					$("#h1").val($("#c1").prop("checked"));
				})
				$("#c2").change(function(){
					$("#h2").val($("#c2").prop("checked"));
				})
				$("#c3").change(function(){
					$("#h3").val($("#c3").prop("checked"));
				})
				
				
			})
			
			function agreeCheck(){
				if(hids[0].value==false || hids[1].value==false){
					alert("필수 약관이 체크되어있어야 다음으로 넘어갑니다");
					return false;
				}
				
				return true;
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
		</script>
		
	</body>
</html>