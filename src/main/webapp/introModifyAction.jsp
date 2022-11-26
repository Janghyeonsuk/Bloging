<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="introduction.Introduction"%>
<%@ page import="introduction.IntroductionDAO"%>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소개글 작성</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	//로그인 안 한 사용자 체크하는 부분
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 이후 이용가능한 서비스 입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	Introduction intro = new IntroductionDAO().getIntro(userID);
	
		if (intro.getIntroContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('칸을 입력해주십시오.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			
		IntroductionDAO introDAO = new IntroductionDAO();
		int result = introDAO.modify(userID, request.getParameter("introContent"));

		if (result >= 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('등록에 성공했습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생해 등록에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	%>
</body>
</html>