<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="blog.Blog"%>
<%@ page import="blog.BlogDAO"%>
<html>
<head>
<meta charset="UTF-8" />
<title>MY BLOG</title>
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<link href="./resources/css/main.css" rel="stylesheet" />
<script src="./resources/js/main.js"></script>
</head>
<body>
	<!-- Menu -->
	<%@ include file="menu.jsp"%>

	<%
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}

	//가장 기본 페이지 1로 설정
	int pageNumber = 1;

	if (request.getParameter("pageNumber") != null) {
		//정수형으로 타입 변경해주는 부분
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>

	<div class="container">
		<div class="text-center my-5">
			<h1 class="fw-bolder"><%=userName%>'s &nbsp Bloging</h1>
			<p>
		</div>
		<div class="row">
			<div class="col-lg-8">
			<div class="card mb-4">
			<%
			BlogDAO blogDAO = new BlogDAO();
			ArrayList<Blog> list = blogDAO.getList(pageNumber);

			for (int i = 0; i < list.size(); i++) {
			%>
							
							<a href="blogView.jsp?blogID=<%=list.get(i).getBlogID()%>"><img class="card-img-top"
								src="./resources/images/<%=list.get(i).getFileName()%>" width="850" height="400"/></a>
							<div class="card-body">
								<div class="small text-muted"><%=list.get(i).getBlogDate().substring(0, 11) + list.get(i).getBlogDate().substring(11, 13) + ":"+ list.get(i).getBlogDate().substring(14, 16)%>
								  | | Bloger -> <%=list.get(i).getUserID() %></div>
								<h2 class="card-title"><%=list.get(i).getMainTitle()%></h2>
								<p class="card-text"><%=list.get(i).getMainContent()%></p>
								<a class="btn btn-primary" href="blogView.jsp?blogID=<%=list.get(i).getBlogID()%>">Read more →</a>
							</div>
							<%
								}
							%>
							<%if(list==null || list.size()==0) {%>
							<a href="#!"><img class="card-img-top"
								src="https://dummyimage.com/850x400/ced4da/6c757d.jpg" /></a>
							<div class="card-body">
								<div class="small text-muted">Posted on January 1, 2022</div>
								<h2 class="card-title">Welcome to Blog Post!</h2>
								<p class="card-text">How about Drawing Bloging?</p>
								<a class="btn btn-primary" href="#!">Let's Drawing →</a>
							</div>
							<%} %>
						</div>
							<%
							//페이지 넘버 보여주는 부분
							if (pageNumber != 1) {
							%>
							<a href="blog.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success">이전</a>
							<%
							}
							if (blogDAO.nextPage(pageNumber + 1)) {
							%>
							<a href="blog.jsp?pageNumber=<%=pageNumber + 1%>"class="btn btn-success">다음</a>
							<%
							}
							%>
						<a href="writeBlog.jsp" class="btn btn-primary"
							style="background-color: #6610f2; text-align: center;">Drawing</a>
						
						<p>
					</div>

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
											<%
											if (intro == null) {
											%>
											<li><a href="intro.jsp">Intro</a></li>
											<%
											} else {
											%>
											<li><a href="introModify.jsp">Edit</a></li>
											<%
											}
											%>
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
		</div>
		<!-- Footer-->
		<%@ include file="footer.jsp"%>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="./resources/js/main.js"></script>
</body>
</html>
