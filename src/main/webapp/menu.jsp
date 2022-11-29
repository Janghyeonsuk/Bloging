<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO"%>
<%@ page import="introduction.Introduction"%>
<%@ page import="introduction.IntroductionDAO"%>
<jsp:useBean id="INTRO" class="introduction.IntroductionDAO" scope="page" />
<jsp:useBean id="USER" class="user.UserDAO" scope="page" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String userID = null;
	String userName = null;

	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		userName = USER.getName(userID);
	}
	
	IntroductionDAO introDAO = new IntroductionDAO();
	Introduction intro = new Introduction();
	intro = introDAO.getIntro(userID);
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand">Bloging</a>
		<a href="https://github.com/Janghyeonsuk/JSPWebProject"><img src="./resources/images/github.png" width="30" height="30"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<%
			if (userID == null) {
			%>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="main.jsp">Home</a></li>
			</ul>
		</div>
		<%
			} else {
			%>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="userLogoutAction.jsp">Logout</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="board.jsp">Board</a></li>
				<%if (intro==null) { %>
				<li class="nav-item"><a class="nav-link" href="intro.jsp">Memo</a></li>
				<%}else { %>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="introModify.jsp">Edit</a></li>
				<%} %>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="blog.jsp">Bloging</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="myBlog.jsp"><% out.print(userName+ "'s Page");%></a></li>
				
				<%if (userID.equals("admin")){ %>
				<li class="nav-item"><a class="nav-link" href="security.jsp">Admin</a></li>
				<%
						} 
					}
				%>
			</ul>
		</div>
	</div>
</nav>