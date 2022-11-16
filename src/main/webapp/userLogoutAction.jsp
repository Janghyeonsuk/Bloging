<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		session.invalidate();	//현재 접속한 회원의 세션을 해제하는 부분
	%>
	
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>