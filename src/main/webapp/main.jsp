<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    	<script>
		 var calendar;	
	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth',
	          selectable : true,
	          events:[
	        	  {
	        		title: "추석",
	        	  	start: "2024-09-16",
	        	  	end :  "2024-09-19"
	        	  }
	          ], 
	          
	          dateClick : function (info){
	        	  console.log(info.dateStr);
	        	  addEventCalendar({start:info.dateStr});
	          }
	        });
	        calendar.render();
	      });
	      
	      function addEventToCalendar(event){
	    	  calendar.addEvent(event);
	      }
	      

    </script>
		<title>main.jsp</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
		<style>
			
			#info{
				width: 500px;
				margin:0 auto;
				text-align : center;
			}
			
			#content{
				position: relative;
			}
			
			
			#calendar{
				width:500px;
				height:500px;
			}
			.imgs{
				width: 100px;
				height: 50px;
			}
			
		</style>
	</head>
	<body>
		
		<div id="wrap">
			<div id=header>
				<header>
				            <h1>
				                <img src="img/pngwing.com-35.png" alt="logo" class="imgs" width="100" height="50">
				                <a href="main.jsp">원하는 모든것을 관리하세요</a>
				            </h1>
				            
				 </header>
		
				<nav>
	            <ul>
	                <li><a href="main.jsp">Home</a></li>
	                <li><a href="gongji.do?currentPage=1">Notice</a></li>
	                <li><a href="photo.do?currentPage=1">Photo</a></li>
	                <li><a href="update.do">회원정보수정</a></li>
	                <c:if test="${grade=='관리자'}">
						<li>
							<a href="show.do">관리자 메뉴</a>
						</li>
					</c:if>
					
					
					<li><a href="out.do" id="out">LogOut</a></li>
	
	            </ul>
	
	        </nav>
	        
	        
			</div>
			
			<div id="content">
				
				<div id="info">
					<div id="calendar"></div>
				
				</div>
			
			
			</div>
			
			
			
			
		
		
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		
		<script>
			let out = document.getElementById("out");
			out.addEventListener("click",function(){
				alert("로그아웃 되었습니다");
				window.history.forward();
			})
			
			
		</script>
	</body>
</html>