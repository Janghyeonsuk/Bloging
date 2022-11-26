<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>BLOGING</title>
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
				<h1 class="fw-bolder">Intro page</h1>
			</div>
		</div>
	</header>
	
<div class="container">
		<p>
		<div class="row">
			<form method="post" action="introAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="backgroud-color: #eeeeee; text-align: left;">Introduction</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea class="form-control" placeholder="please write Introduction"
									name="introContent" maxlength="3000" style="height: 150px;" required></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="설정하기"></input>
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
