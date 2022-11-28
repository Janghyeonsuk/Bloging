<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Blog"%>
<%@ page import="blog.BlogDAO" %>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>BOARD DELETE</title>
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
		
		int commentID=0;
		if(request.getParameter("commentID") != null){
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}	

		Comment comment = new CommentDAO().getComment(commentID);
		
		if(!userID.equals(comment.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제가능한 권한이 없습니다.')");
			script.println("location.href = 'blog.jsp'");
			script.println("</script>");	
		}
		else {
				CommentDAO commentDAO = new CommentDAO();
				int result = commentDAO.delete(commentID); 
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'blogView.jsp?blogID='" + blogID);
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 삭제에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
			}
		}

	%>
</body>
</html>