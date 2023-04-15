<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_components/all_css.jsp"%>
<style>

html, body {
	height: 100%;
}

body {
	background-color: #f0f1f2;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.form-cont{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100vw;
	height: 100vh;
}
</style>
</head>
<body class="text-center">

	<%@include file="all_components/navbar.jsp"%>
	
	<c:if test="${not empty succMsg }">
	<div class="alert alert-danger" role="alert">${succMsg}</div>
	<c:remove var="succMsg"/>
	</c:if>
	
	<div class="form-cont">
	<div class="form-signin m-autox w-100">
		<form action="login" method="post">
		<img class="mb-4" src="img/login-1.gif" alt="">
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput"
					placeholder="name@example.com" name="email"> <label for="floatingInput">Email
					address</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password" name="password"> <label for="floatingPassword">Password</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
				in</button>
			<p class="mt-2 mb-3 text-muted">&copy; 2023</p>
		</form>
	</div>
	</div>
</body>
</html>