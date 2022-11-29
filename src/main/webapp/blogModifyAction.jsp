<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Blog"%>
<%@ page import="blog.BlogDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>blogModifyAction</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");	
	
	String userID = null;
	if(session.getAttribute("userID") != null){	
		userID = (String) session.getAttribute("userID");
	}

		
		if(userID == null){	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 이후 이용가능한 서비스 입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");	
		}
		
		int blogID=0;
		if(request.getParameter("blogID") != null){
			blogID = Integer.parseInt(request.getParameter("blogID"));
		}
		
		if(blogID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'blog.jsp'");
			script.println("</script>");	
		}		
		
		Blog blog = new BlogDAO().getBlog(blogID);
		
		if(!userID.equals(blog.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정가능한 권한이 없습니다.')");
			script.println("location.href = 'blog.jsp'");
			script.println("</script>");	
		}
		else {
			if(request.getParameter("mainTitle").equals("") || request.getParameter("mainContent").equals("") || 
					request.getParameter("serveTitle").equals("") || request.getParameter("serveContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 칸을 입력해주십시오.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else {
				BlogDAO blogDAO = new BlogDAO();
				int result = blogDAO.modify(blogID, request.getParameter("mainTitle"), request.getParameter("mainContent"),
						request.getParameter("serveTitle"), request.getParameter("serveContent")); 
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정을 완료하였습니다.')");
					script.println("location.href = 'blog.jsp'");
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
				}
			}
		}

	%>
</body>
</html>