<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>BLOGING</title>
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<link href="./resources/css/main.css" rel="stylesheet" />
<link href="./resources/css/slide.css" rel="stylesheet" />
</head>
<body>
	<!-- Menu -->
	<%@ include file="menu.jsp"%>

	<%
	if (userID == null) {
	%>
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">Do You Want to be a Bloging User?</h1>
				<p>
				<p class="lead mb-0">여러분 모두 블로깅을 이용하실 수 있습니다.</p>
			</div>
		</div>
	</header>
	<%
	}
	%>
	<%
	if (userID != null) {
	%>
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder"><%=userName%>'s Blog</h1>
				<p>
				<p class="lead mb-0">Bloging에 오신것을 진심으로 환영합니다!</p>
			</div>
		</div>
	</header>
	<%
	}
	%>
	
	<div class="section">
		<input type="radio" name="slide" id="slide01" checked> <input
			type="radio" name="slide" id="slide02"> <input type="radio"
			name="slide" id="slide03">
		<div class="slidewrap">
			<ul class="slidelist">
				<!-- 슬라이드 영역 -->
				<li class="slideitem"><a> <img
						src="./resources/images/img1.png" border="0" height="500">
				</a></li>
				<li class="slideitem"><a> <img
						src="./resources/images/img2.png" border="0" height="500">
				</a></li>
				<li class="slideitem"><a> <img
						src="./resources/images/img3.png" border="0" height="500">
				</a></li>

				<!-- 좌,우 슬라이드 버튼 -->
				<div class="slide-control">
					<div>
						<label for="slide03" class="left"></label> <label for="slide02"
							class="right"></label>
					</div>
					<div>
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label>
					</div>
					<div>
						<label for="slide02" class="left"></label> <label for="slide01"
							class="right"></label>
					</div>
				</div>

			</ul>
			<!-- 페이징 -->
			<ul class="slide-pagelist">
				<li><label for="slide01"></label></li>
				<li><label for="slide02"></label></li>
				<li><label for="slide03"></label></li>
			</ul>
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
