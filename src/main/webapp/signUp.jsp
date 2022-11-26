<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/login.css" />
<link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
<title>회원가입</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.myBundle">
		<div class="container">
			<h1><fmt:message key="signup"/></h1>
			<form name="signUpForm" action="./userJoinAction.jsp" method="post">
				<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
				<div class="form-control">
					<input type="text" id="userID" name="userID" required /> <label><fmt:message
							key="userId" /></label>
				</div>
				<div class="form-control">
					<input type="text" id="userPassword" name="userPassword" required />
					<label><fmt:message key="userPassword" /></label>
				</div>
				<div class="form-control">
					<input type="text" id="userName" name="userName" required /> 
					<label><fmt:message key="userName" /></label>
				</div>
				<button class="btn" type="submit" onclick="checkSignUp()">
					<fmt:message key="signup" />
				</button>
			</form>
		</div>
		<script src="./resources/js/login.js"></script>
	</fmt:bundle>
</body>
</html>