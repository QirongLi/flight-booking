<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

.tables {
width:800px;
}
</style>
</head>
<body>
	<div class="container">
		<br />
		<div class="tables">
		<h3 style="color:white;">Ticket Table</h3>
		<c:if test="${!empty tickets}">
			<table class="table table-striped">
				<tr>
					<th>Ticket ID</th>
					<th>Flight ID</th>
					<th>Price</th>
					<th>Status</th>
				</tr>
				<c:forEach items="${tickets}" var="ticket">
					<tr class="active">
						<td>${ticket.ticket_id}</td>
						<td>${ticket.flight.flight_id}</td>
						<td>${ticket.price}</td>
						<td>${ticket.payment}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${empty tickets}">
			<p style="color:white;">No records were found...</p>
		</c:if>
	</div>
	</div>
</body>
</html>