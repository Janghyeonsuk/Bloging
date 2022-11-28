<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>Board</title>
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<link href="./resources/css/main.css" rel="stylesheet" />
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
	%>
	
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">Write Board</h1>
			</div>
		</div>
	</header>
	
	<div class="container">
		<div class="row">
			<form method="post" action="boardWriteAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="backgroud-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="boardTitle" maxlength="50"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="boardContent" maxlength="3000" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" style="float: right;" value="작성하기"></input>
			</form>
		</div>
	</div>
	<p>
		<!-- Footer-->
		<jsp:include page="footer.jsp" />
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="./resources/js/main.js"></script>
</body>
</html>
