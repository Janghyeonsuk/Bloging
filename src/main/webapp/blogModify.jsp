<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="blog.Blog" %>
<%@ page import="blog.BlogDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>Redrawing</title>
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<link href="./resources/css/main.css" rel="stylesheet" />
<script src="./resources/js/main.js"></script>
</head>
<body>
<!-- Menu -->
	<%@ include file="menu.jsp"%>
	<%
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
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
		
		BlogDAO blogDAO = new BlogDAO();
		Blog blog = new Blog();
		blog = blogDAO.getBlog(blogID);
		
		if(!userID.equals(blog.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정가능한 권한이 없습니다.')");
			script.println("location.href = 'blog.jsp'");
			script.println("</script>");	
		}
	%>
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">Redrawing Bloging</h1>
			</div>
		</div>
	</header>
	
	<!-- 글쓰기 양식 부분 -->
	<div class="container">
		<div class="row">
			<form method="post" action="blogModifyAction.jsp?blogID=<%=blog.getBlogID()%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="주 제목" name="mainTitle" maxlength="50" value="<%=blog.getMainTitle()%>"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="주 내용"
									name="mainContent" maxlength="5000" style="height: 350px;"><%=blog.getMainContent()%></textarea></td>
						</tr>

						<tr>
							<td><input type="text" class="form-control"
								placeholder="부 제목" name="serveTitle" maxlength="50" value="<%=blog.getServeTitle()%>"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="부 내용"
									name="serveContent" maxlength="2000" style="height: 350px;"><%=blog.getServeContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-success" style="float: right;" value="Redraw"></input>
			</form>
			<p>
		</div>
	</div>
	<!-- Footer-->
	<jsp:include page="footer.jsp" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/main.js"></script>
</body>
</html>