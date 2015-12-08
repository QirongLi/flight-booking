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
<br />
	<div class="container">
		<form:form modelAttribute="flight" action="manageFlight/newFlight"
			method="post">
			<div class="form-group">
				<form:label path="start_city">Start City:</form:label>
				<form:input path="start_city" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="destination">Destination:</form:label>
				<form:input path="destination" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="start_time">Start Time:</form:label>
				<form:input path="start_time" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="arrive_time">Arrive Time:</form:label>
				<form:input path="arrive_time" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="price">Price:</form:label>
				<form:input path="price" type="text" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="total_ticket">Total Ticket:</form:label>
				<form:input path="total_ticket" type="text" class="form-control" />
			</div>
			<input type="submit" value="Add Flight" class="btn btn-default" />
			<br />
		</form:form>
	</div>
</body>
</html>