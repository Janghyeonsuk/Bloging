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
<title>SIGN UP</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String userID = request.getParameter("userID");
	
	if (USER.getUserID().equals("") || USER.getUserPassword().equals("") || USER.getUserName().equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('모든 칸을 입력해주십시오.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDao = new UserDAO();
		int result = userDao.join(USER);

		if (result >= 0) {
			session.setAttribute("userID", USER.getUserID());
			Cookie cookie_id = new Cookie("userID", userID);
			response.addCookie(cookie_id);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입에 성공하였습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	%>
</body>
</html>