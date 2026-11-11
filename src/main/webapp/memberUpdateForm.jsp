<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("userID");//수정할 회원의 아이디
		
		String sql="SELECT * FROM members WHERE ID = ?";
				
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		String username = "root";
		String password = "12345";
				
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
				
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
					
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uid);

			rs = pstmt.executeQuery();
						
			if(rs.next()) {//true면 아이디로 검색된 레코드가 있다 false면 아이디로 검색된 레코드가 없다
				String userid = rs.getString("id");
				String userpw = rs.getString("passwd");
				String usermail = rs.getString("email");
				String userdate = rs.getString("signuptime");
							
				MemberDto memberDto = new MemberDto(userid, userpw, usermail, userdate); 
								
				request.setAttribute("memberDto", memberDto);
			}
			
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}
	%>

	<h2>회원 정보 수정</h2>
	<hr>
	<form action="memberUpdateOk.jsp" method="post">
		아이디: <input type="text" name="uid" value="${memberDto.id }" readonly="readonly"><br><br>
		비밀번호: <input type="password" name="upw" value="${memberDto.passwd }"><br><br>
		이메일: <input type="email" name="uemail" value="${memberDto.email }"><br><br>
		가입일: <input type="text" name="udate" value="${memberDto.signuptime }" readonly="readonly"><br><br>
		<input type="submit" value="수정 완료">
		
	</form>
	
	<%
		

	
	%>
</body>
</html>