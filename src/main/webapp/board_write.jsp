<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 쓰기</title>
		<link rel="stylesheet" href="CSS/header.css">
		<script src="https://cdn.ckeditor.com/ckeditor5/38.1.1/classic/ckeditor.js"></script>
		<style>
			#wrap{
				text-align : center;
			}
			
			.ck-editor__editable {
			    min-height: 300px;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<h2>글쓰기</h2>
			<form method="post" action="write.do" name="frm">
				<span>글쓴이 : </span><input type="text" name=id value="${loginUser }" readonly><br>
				<span>제목 : </span><input type="text" name="title" placeholder="제목을 입력해주세요" required><br>
				<span>내용</span><textarea name="content" rows="80" cols="50" id="editor"></textarea><br>
				<span>수정용 비밀번호 : </span><input type="password" name="pwd" required>
				<!-- 파일업로드 , 파일사이즈 -->
				<input type="text" id="nowDate" name="date">
				<input type="submit" value="작성하기">
				
			</form>
			
		</div>
		<script>
			let date = new Date();
			let months= "";
			let now = document.getElementById("nowDate");
			if((date.getMonth()+1)<10){
				months= "0"+(date.getMonth()+1);
			}else{
				months = date.getMonth();
			}
			let years = date.getFullYear();
			
			let days = date.getDate();
			if(days<10){
				days= "0"+days;
			}
			
			
			let fullDate = years+""+months+""+days;
			console.log(fullDate);
			now.setAttribute("value",fullDate);
		</script>
		<script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
            } );
   	 	</script>
		
	</body>
</html>