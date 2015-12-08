<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<br />
		<form:form modelAttribute="user" action="register/newUser"
			method="post">
			<div class="form-group">
				<form:label path="username">Username:</form:label>
				<form:input path="username" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="firstname">Firstname:</form:label>
				<form:input path="firstname" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="lastname">Lastname:</form:label>
				<form:input path="lastname" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="phone">Phone:</form:label>
				<form:input path="phone" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input path="email" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="address">Address:</form:label>
				<form:input path="address" type="text" class="form-control" />
			</div>
				<input type="submit" value="Add User" class="btn btn-default"/><br />
		</form:form>
	</div>
</body>
</html>