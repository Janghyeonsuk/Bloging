<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="blog.Blog"%>
<%@ page import="blog.BlogDAO"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="blog" class="blog.Blog" scope="page" />
<jsp:setProperty name="blog" property="mainTitle" />
<jsp:setProperty name="blog" property="mainContent" />
<jsp:setProperty name="blog" property="serveTitle" />
<jsp:setProperty name="blog" property="serveContent" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>
	<%
			request.setCharacterEncoding("UTF-8");	
		
			String userID = null;
			if(session.getAttribute("userID") != null){	
				userID = (String) session.getAttribute("userID");
			}
			
			String readFolder="C:\\jsp-work\\JSPWebProject\\src\\main\\webapp\\resources\\images";
			int maxSize =5 * 1024 * 1024;
			String encType="utf-8";

			MultipartRequest multi = new MultipartRequest(request, readFolder, maxSize,encType,new DefaultFileRenamePolicy());
			
			String mainTitle = multi.getParameter("mainTitle");
			String mainContent = multi.getParameter("mainContent");
			String serveTitle = multi.getParameter("serveTitle");
			String serveContent = multi.getParameter("serveContent");
			
			Enumeration files = multi.getFileNames();
			String fname =(String) files.nextElement();
			String fileName = multi.getFilesystemName(fname);
			File file = multi.getFile(fileName);
			
			if(mainTitle.equals("") || mainContent.equals("") || 
					serveTitle.equals("") || serveContent.equals("") || fileName.equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 칸을 입력해주십시오.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else {
				BlogDAO blogDAO = new BlogDAO();
				int result = blogDAO.write(mainTitle, mainContent, userID, serveTitle, serveContent, fileName); 
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 등록에 성공하였습니다.')");
					script.println("location.href = 'blog.jsp'");
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