<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>Security</title>
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<link href="./resources/css/main.css" rel="stylesheet" />
<link href="./resources/css/slide.css" rel="stylesheet" />
</head>
<body>
	<!-- Menu -->
	<%@ include file="menu.jsp"%>

	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">관리 페이지</h1>
				<p>
				<p class="lead mb-0">관리자만 사용할 수 있습니다..</p>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="row">
			<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<br>
					<tr>
						<td><a onclick="return confirm('블로그를 비활성화 하시겠습니까?')" href="blogUnavailable.jsp"class="btn btn-warning">블로그 비활성화</a><td>
						<td><a onclick="return confirm('블로그를 활성화 하시겠습니까?')" href="blogAvailable.jsp"class="btn btn-primary">블로그 활성화</a><td>
						<td><a onclick="return confirm('블로그를 비활성화 하시겠습니까?')" href="boardUnavailable.jsp"class="btn btn-warning">게시판 비활성화</a><td>
						<td><a onclick="return confirm('블로그를 비활성화 하시겠습니까?')" href="boardAvailable.jsp"class="btn btn-primary">게시판 활성화</a><td>
					</tr>
				</tbody>
			</table>
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
