<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사진 업로드</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<h1>사진 업로드</h1>
			<form method="post" enctype="multipart/form-data" action="photo.do" id="frm">
				<span>작성자<input type="text" name="writer" value="${loginUser }" readonly></span><br>
				<span>사진 제목<input type="text" name="title" placeholder="사진 제목을 입력해주세요" required></span><br>
				<span>사진 설명<input type="text" name="content" required></span><br>
				<span>사진<input type="file" name="photo" required></span><br>
				
				<input type="submit" value="사진 업로드" id="sub">
			</form>
			<button onclick="location.href='photo.do?currentPage=1'">목록 보러가기</button>
			<jsp:include page="footer.jsp"></jsp:include>
			<script>
				let sub = document.getElementById("sub");
				let frm = document.getElementById("frm");
				
				
				sub.addEventListener("click",function(){
					if(frm.title.value.length != 0 && frm.content.value.length != 0 && frm.photo.value.length != 0){
						alert("사진이 업로드 되었습니다");	
					}
					
				});
			</script>
			
		</div>
	</body>
</html>