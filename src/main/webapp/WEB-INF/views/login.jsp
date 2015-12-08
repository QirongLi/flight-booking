<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<style type="text/css">
#wrapper {
	width: 500px;
	margin: 0 auto;
	padding: 5px;
}

body {
	background-color: #236B8E;
	font: Verdana;
}
</style>
</head>

<body onload='document.f.j_username.focus();'>
	<div id="wrapper">
		<br>

		<form class="form-inline" role="form" name='f'
			action='${pageContext.request.contextPath}/j_spring_security_check'
			method='POST'>

			<div class="form-group">
				<h3 class="text-center">Login with Username and Password</h3>
				<br>
				<c:if test="${param.error != null}">
					<span class="bg-danger">Login failed. Check your username or
						password</span>
				</c:if>
			</div>

			<p class="text-center">
			<div class="form-group">
				<label class="sr-only">User:</label>
				<div class="col-sm-10">
					<input type='text' class="form-control" name='j_username' value=''
						placeholder="Username" />
				</div>
			</div>
			</p>
			<p class="text-center">
			<div class="form-group">
				<label class="sr-only">Password:</label>
				<div class="col-sm-10">
					<input class="form-control" type='password' name='j_password'
						placeholder="Password" />
				</div>
			</div>
			</p>
			<p class="text-center">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input name="submit" class="btn btn-default" type="submit"
						value="Login" />
				</div>
			</div>
			</p>
		</form>
	</div>
</body>
</html>