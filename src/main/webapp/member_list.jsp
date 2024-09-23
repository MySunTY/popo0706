<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원리스트</title>
		<link rel="stylesheet" href="CSS/header.css">
		<link rel="stylesheet" href="CSS/footer.css">
		<style>
			th , td{
				border:1px solid black;
			}
			#wrap{
				text-align : center;
			}
			table{
				width: 80%;
				margin: auto;
			}
			
		</style>
	</head>
	<body>
			<div id="wrap">
				<jsp:include page="header.jsp"></jsp:include>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url = "jdbc:mysql://127.0.0.1:3306/member";
			String db_id="root";
			String db_pw="12345678";
			String sql="select * from register;";
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				%>
				
					<h1>회원리스트</h1>
					<table>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>닉네임</th>
						<th>통신사</th>
						<th>연락처</th>
						<th>생년월일</th>
						<th>약관동의(필수)</th>
						<th>약관동의(필수2)</th>
						<th>약관동의(선택)</th>
						
					</tr>
				<%
				
				
				while(rs.next()){
					String num = rs.getString("num");
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String nick = rs.getString("nick");
					String tong = rs.getString("tongsinsa");
					String phone = rs.getString("phone");
					String birth = rs.getString("birth");
					String s_a = rs.getString("s_a");
					String p_a = rs.getString("p_a");
					String e_a = rs.getString("e_a");
					%>
						<tr>
							<td><%=num %></td>
							<td><%=id %></td>
							<td><%=pw %></td>
							<td><%=name %></td>
							<td><%=email %></td>
							<td><%=nick %></td>
							<td><%=tong %></td>
							<td><%=phone %></td>
							<td><%=birth %></td>
							<td><%=s_a %></td>
							<td><%=p_a %></td>
							<td><%=e_a %></td>
							
						
						</tr>
					<%
				}
				%>
				
				</table>
				
				<%
			}catch(Exception e){
				System.out.println("member_list.jsp ing error" +e);
			}finally{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
					
				}catch(Exception ex){
					System.out.println("member_list.jsp end error"+ex);
				}
			}
			
		%>
		
		</div>
	</body>
</html>