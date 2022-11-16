<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="USER" class="user.UserRepository" scope="page"/>
<jsp:setProperty name="USER" property="userID"/>
<jsp:setProperty name="USER" property="userPassword"/>
<jsp:setProperty name="USER" property="userName"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		//로그인이 되어있으면, 로그인 창에 접근을 못하게 하기 위해 세션 확인을 해주는 부분
		String userID = null;
		if(session.getAttribute("userID") != null){	//로그인 혹은 회원가입을 통해 이미 세션이 있는 상태라면,
			userID = (String) session.getAttribute("userID"); // userID 세팅
		}
		
		if(userID != null){	//userID가 null이 아니라는 것은 이미 로그인 한 것!
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있는 사용자 입니다.' + userID + ')'");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");	
		}
		
		if(USER.getUserID().equals("") || USER.getUserPassword().equals("") || USER.getUserName().equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 칸을 입력해주십시오.')");
			script.println("history.back()");
			script.println("</script>");	
		}
		else {
			UserDAO userDao = new UserDAO();
			int result = userDao.join(USER); 
			
			if(result >= 0){
				session.setAttribute("userID", USER.getUserID());	//USER의 ID를 세션값으로 설정해준다.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입에 성공하였습니다.')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");	
			} else if(result == -1){
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