<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ">
<title>Board</title>
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
				
		int pageNumber = 1;
		
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">Bloging Board</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 글번호 </th>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 글제목 </th>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 작성자 </th>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 작성일 </th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getList(pageNumber);
						
						for(int i = 0; i<list.size(); i++){
					%>
						<tr>
						<td><%= list.get(i).getBoardID() %></td>
						<td><a href="boardView.jsp?boardID=<%=list.get(i).getBoardID()%>"><%=list.get(i).getBoardTitle()%></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11,13) + ":" + list.get(i).getBoardDate().substring(14,16)%></td>
					</tr>
					<%
						}	
					%>					
				</tbody>
			</table>
			</div>
			<%
				if(pageNumber != 1){
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success">이전</a>
			<%	
				} if (boardDAO.nextPage(pageNumber + 1)) {
			%>
					<a href="board.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success">다음</a>
			<%
				}
			%>
			
			<a href="writeBoard.jsp" class="btn btn-primary pull-right" style="float: right;">글 작성하기</a>
			<p>
	</div>
	<br>	
	<!-- Footer-->
	<jsp:include page="footer.jsp" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/main.js"></script>
</body>
</html>
