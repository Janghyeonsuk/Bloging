<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/login.css" />
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<title>로그인</title>
</head>
<body>
	<div class="container">
		<h1>로그인</h1>
		<form action="./userLoginAction.jsp" method="post">
			<div class="form-control">
				<input type="text" id="userID" name="userID" required/><label>ID</label>
			</div>
			<div class="form-control">
				<input type="text" id="userPassword"name="userPassword" required /><label>Password</label>
			</div>
			<button class="btn" type="submit">로그인</button>
			<p class="text">계정이 필요한가요? <a href="./signUp.jsp"> 회원가입 </a>
		</form>
	</div>
	<script src="./resources/js/login.js"></script>
</body>
</html>