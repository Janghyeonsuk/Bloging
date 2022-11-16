<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/login.css" />
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<title>회원가입</title>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form name ="signUpForm" action="./userJoinAction.jsp" method="post">
			<div class="form-control">
				<input type="text" id="userID" name="userID" required/> <label>ID</label>
			</div>
			<div class="form-control">
				<input type="text" id="userPassword" name="userPassword" required /> <label>Password</label>
			</div>
			<div class="form-control">
				<input type="text" id="userName" name="userName" required/> <label>Name</label>
			</div>
			<button class="btn" type="submit">회원가입</button>
		</form>
	</div>
	<script src="./resources/js/login.js"></script>
</body>
</html>