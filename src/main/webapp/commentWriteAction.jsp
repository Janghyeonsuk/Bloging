<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="comment" class="comment.Comment" scope="page"/>
<jsp:setProperty name="comment" property="commentContent"/>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>Comment WRITE</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");	
	
		String userID = null;
		if(session.getAttribute("userID") != null){	
			userID = (String) session.getAttribute("userID");
		}
		
		int blogID = 0;
		if(request.getParameter("blogID") != null){
			blogID = Integer.parseInt(request.getParameter("blogID"));
		}
		
			if(comment.getCommentContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 칸을 입력해주십시오.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				CommentDAO commentDAO = new CommentDAO();
				int result = commentDAO.write(blogID, userID, comment.getCommentContent()); 
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 등록에 성공하였습니다.')");
					script.println("location.href = 'blog.jsp'");
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 등록에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
				}
			}

	%>
</body>
</html>