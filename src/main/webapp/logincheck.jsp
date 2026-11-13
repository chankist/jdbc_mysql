<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
		String mid = request.getParameter("userId");
		
		if(mid != "") {
			out.println("유저가 없습니다.");
			response.sendRedirect("memberUpdate.jsp");
			
		} else {
			response.sendRedirect("memberUpdateFormlogin.jsp");
			
		}
		 %>
</body>
</html>