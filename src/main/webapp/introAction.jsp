<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="introduction.Introduction"%>
<%@ page import="introduction.IntroductionDAO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="intro" class="introduction.Introduction" scope="page" />
<jsp:setProperty name="intro" property="introContent" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MEMO 작성</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");	
		
		String userID = null;
		if(session.getAttribute("userID") != null){	
			userID = (String) session.getAttribute("userID");
		}

			if(intro.getIntroContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('칸을 입력해주십시오.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else {
				IntroductionDAO introDAO = new IntroductionDAO();
				int result = introDAO.write(userID, intro.getIntroContent());
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('등록에 성공했습니다.')");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 등록에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
				}
			}

	%>
</body>
</html>