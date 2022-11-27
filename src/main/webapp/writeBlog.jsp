<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>Drawing Blog</title>
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
				<h1 class="fw-bolder">Drawing Blog</h1>
			</div>
		</div>
	</header>
	
	<!-- 글쓰기 양식 부분 -->
	<div class="container">
		<div class="row">
			<form method="post" encType = "multipart/form-data" action="blogWriteAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="주 제목" name="mainTitle" maxlength="50"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="주 내용"
									name="mainContent" maxlength="5000" style="height: 200px;"></textarea></td>
						</tr>

						<tr>
							<td><input type="text" class="form-control"
								placeholder="부 제목" name="serveTitle" maxlength="50"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="부 내용"
									name="serveContent" maxlength="3000" style="height: 200px;"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="fileName"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="Bloging"></input>
			</form>
		</div>
	</div>
	<p>
		<!-- Footer-->
		<%@ include file="footer.jsp"%>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="./resources/js/main.js"></script>
</body>
</html>
