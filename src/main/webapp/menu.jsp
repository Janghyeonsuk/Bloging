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

	//로그인한 사용자들이라면, userID에 값이 담기게될 것!
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
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<%
			//아무도 로그인 되어있지 않을 때만 로그인/회원가입 메뉴를 보이게 하기 위함.
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
			} else { //로그인이 되어있는 사용가자 보는 메뉴
			%>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="userLogoutAction.jsp">Logout</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="board.jsp">Board</a></li>
				<%if (intro==null) { %>
				<li class="nav-item"><a class="nav-link" href="intro.jsp">Intro</a></li>
				<%}else { %>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="introModify.jsp">Edit</a></li>
				<%} %>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="blog.jsp">Bloging</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!"><% out.print(userName+ "'s Page");%></a></li>	
			</ul>
		</div>
		<%
			}
			%>
	</div>
</nav>