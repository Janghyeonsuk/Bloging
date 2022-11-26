<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/login.css" />
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<title>로그인</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.myBundle">
		<div class="container">
			<h1><fmt:message key="login" /></h1>
			<form action="./userLoginAction.jsp" method="post">
				<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
				<div class="form-control">
					<input type="text" id="userID" name="userID" required /> <label><fmt:message
							key="userId" /></label>
				</div>
				<div class="form-control">
					<input type="text" id="userPassword" name="userPassword" required />
					<label><fmt:message key="userPassword" /></label>
				</div>
				<button class="btn" type="submit">
					<label><fmt:message key="login" /></label>
				</button>
				<p class="text">
					<fmt:message key="phrase" />
					<a href="./signUp.jsp">&nbsp &nbsp<fmt:message key="signup" /></a>
			</form>
		</div>
	</fmt:bundle>
	<script src="./resources/js/login.js"></script>
</body>
</html>