<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="blog.Blog"%>
<%@ page import="blog.BlogDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<html>
<head>
<meta charset="UTF-8" />
<title>BlogView</title>
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
%>


	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title-->
						<h1 class="fw-bolder mb-1"><%=blog.getMainTitle() %></h1>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2"><%=blog.getBlogDate().substring(0,11) + blog.getBlogDate().substring(11,13) + ":" + blog.getBlogDate().substring(14,16) %>
						| | Bloger -> <%=blog.getUserID() %></div>
					</header>
					<!-- Preview image figure-->
					<figure class="mb-4">
						<img class="img-fluid rounded"
							src="./resources/images/<%=blog.getFileName()%>"  />
					</figure>
					<!-- Post content-->
					<section class="mb-5">
						<p class="fs-5 mb-4"><%=blog.getMainContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
						<h2 class="fw-bolder mb-4 mt-5"><%=blog.getServeTitle() %></h2>
						<p class="fs-5 mb-4"><%=blog.getServeContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
					</section>
					<%
						if(userID != null && userID.equals(blog.getUserID())) { 
					%>
					<hr>
					<a href="blogModify.jsp?blogID=<%=blogID%>" class="btn btn-success"">Redrawing</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="blogDeleteAction.jsp?blogID=<%=blogID%>"
					 class="btn btn-primary" style="background-color: #dc3545; float: right; text-align: center;">삭제</a>
					<%
						}
					%>	
					<p>
					<hr>
				</article>
				
				<!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4" method ="post" action="commentWriteAction.jsp">
                                	<textarea class="form-control" name="commentContent" rows="2" placeholder="Join the discussion and leave a comment!"></textarea>
                                	<input type="hidden" name= "blogID" value="<%=blogID %>">
                                	<input type="submit" style="float: right;">
                                </form>
                                <%
									CommentDAO commentDAO = new CommentDAO();
									ArrayList<Comment> list = commentDAO.getList();

									for (int i = 0; i < list.size(); i++) {
										 if(blogID == list.get(i).getBlogID()){
								%>
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="ms-3">
                                        <div class="fw-bold">
                                        	<%=list.get(i).getUserID() %>
                                        </div>
                                        <%=list.get(i).getCommentContent() %>
                                        <% if(userID.equals(list.get(i).getUserID())){ %>
                                         <a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" >삭제</a>
                                         <% } %>
                                    </div>
                                </div>
                                <p>
                                 <% 
										 }
									}
								 %>
                               
                            </div>
                        </div>
                    </section>
			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<div class="card mb-4">
							<div class="card-header">
								[<%=userName%>
								Bloging] &nbsp Memo
							</div>
							<%
							if (intro == null) {
							%>
							<div class="card-body">메모를 작성하세요! 언제 까먹을지 모릅니다.</div>
							<%
							} else {
							%>
							<div class="card-body">
								<%=intro.getIntroContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
							</div>
							<%
							}
							%>
						</div>
				<div class="card mb-4">
					<div class="card-header">Menu</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="main.jsp">Home</a></li>
									<li>┉┉┉┉┉</li>
									<li><a href="board.jsp">Board</a></li>
									<li>┉┉┉┉┉</li>
									<%if (intro==null) { %>
									<li><a href="intro.jsp">Intro</a></li>
									<%}else { %>
									<li><a href="introModify.jsp">Edit</a></li>
									<%} %>
									<li>┉┉┉┉┉</li>
									<li><a href="writeBlog.jsp">Draw</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

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
