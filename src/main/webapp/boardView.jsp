<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>BoardView</title>
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
	
		int boardID=0;
		if(request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");	
		}
		
		BoardDAO boardDAO = new BoardDAO();
		Board board = new Board();
		board = boardDAO.getBoard(boardID);
	%>

	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder"></h1>
			</div>
		</div>
	</header>
	<!-- 게시판 글보이는 부분 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr><th colspan="3" style="backgroud-color:#eeeeee; text-align: center;"> 게시판 글 보기 </th></tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 200px">글 제목</td>
						<td colspan="2">
							<%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= board.getBoardDate().substring(0,11) + board.getBoardDate().substring(11,13) + ":" + board.getBoardDate().substring(14,16)%></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td colspan="2" style="min-height: 200px text-align: left">
							<%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			<a href="board.jsp" class="btn btn-primary">목록</a>
			
			<%
				//현재 접속한 사람이 글 작성자라면 수정/삭제 가능하도록 수정 버튼 보이기
				if(userID != null && userID.equals(board.getUserID())) { 
			%>
					<a href="boardModify.jsp?boardID=<%=boardID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDeleteAction.jsp?boardID=<%=boardID%>" class="btn btn-primary warning"
					style="background-color: #dc3545; text-align: center;">삭제</a>
			<%
				}
			%>
		
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