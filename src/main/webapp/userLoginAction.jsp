<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="USER" class="user.User" scope="page" />
<jsp:setProperty name="USER" property="userID" />
<jsp:setProperty name="USER" property="userPassword" />
<jsp:setProperty name="USER" property="userName" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String SQL = "SELECT userName FROM USER WHERE userID = ?";
	

	String userID = null;
	String userName = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		userName = (String) session.getAttribute("userName");
	}

	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있는 사용자 입니다.' + userID + ')'");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}

	UserDAO userDao = new UserDAO();
	int result = userDao.login(USER.getUserID(), USER.getUserPassword());

	if (result == 1) {
		session.setAttribute("userID", USER.getUserID());
		session.setAttribute("userName", USER.getUserName());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공했습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스에 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>