<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
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
<body>
<div id="wrapper">
	<br />
	<h3 style="color:white;">Welcome! Please enter information about yourself !</h3>
	<br />
<form:form modelAttribute="user" action="register/newUser" method="post">
	<div class="form-group">
				<form:label path="username" style="color:white;">Username:</form:label>
				<form:input path="username" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="password" style="color:white;">Password:</form:label>
				<form:input path="password" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="firstname" style="color:white;">Firstname:</form:label>
				<form:input path="firstname" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="lastname" style="color:white;">Lastname:</form:label>
				<form:input path="lastname" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="phone" style="color:white;">Phone:</form:label>
				<form:input path="phone" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="email" style="color:white;">Email:</form:label>
				<form:input path="email" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="address" style="color:white;">Address:</form:label>
				<form:input path="address" type="text" class="form-control" />
			</div>
			<div>
			<input type="submit" value="Register!" class="btn btn-default" style="float: left; width: 100px;"/>
			<div style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<button class="btn btn-default"><a href="http://localhost:8080/edu/" style="color:black; float: left;width: 75px;">Back</a></button>
			</div>
	</form:form>
	</div>
</body>
</html>