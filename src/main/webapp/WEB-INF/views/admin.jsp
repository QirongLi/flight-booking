<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
<title>Admin Work Area</title>

<script type="text/javascript">
	function deleteFlight(event) {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				location.reload(true);
			}
		}
		xmlhttp.open("DELETE", "admin/" + event.target.id, true);
		xmlhttp.send();
	}

	function deleteUser(event) {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				location.reload(true);
			}
		}
		xmlhttp.open("DELETE", "admin/user/" + event.target.id, true);
		xmlhttp.send();
	}
</script>

<style type="text/css">
#wrapper {
	width: 500px;
	margin: 0 auto;
	padding: 5px;
	color:white;
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
		<br /> <a href="${pageContext.request.contextPath}/manageFlight"
			class="btn btn-primary btn-lg active">Add a Flight</a> <a
			href="${pageContext.request.contextPath}/manageUser"
			class="btn btn-primary btn-lg active">Add a User</a>
		<sec:authorize access="isAuthenticated()">
			<a href="<c:url value='/j_spring_security_logout'/>"
				class="btn btn-primary btn-lg active">Log out</a>
		</sec:authorize>
		<br />

		<div class="tables">
			<h3 style="color:white;">User Table</h3>
			<c:if test="${!empty userList}">
				<table class="table table-striped">
					<tr>
						<th>User ID</th>
						<th>Username</th>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Email</th>
						<th>Phone</th>
						<th>View Detail</th>
						<th></th>
					</tr>
					<c:forEach items="${userList}" var="user">
						<form id="user"
							action="${pageContext.request.contextPath}/admin/viewHistory"
							method="get">
							<tr class="active">
								<td>${user.user_id}</td>
								<input type="hidden" name="user_id" value="${user.user_id}" />
								<td>${user.username}</td>
								<td>${user.firstname}</td>
								<td>${user.lastname}</td>
								<td>${user.email}</td>
								<td>${user.phone}</td>
								<td><input value="View History" type="submit" /></td>
								<%-- <td><a href="#" id="${user.user_id}"
							onclick="deleteUser(event)">Delete</a></td> --%>
								<td></td>
							</tr>
						</form>
					</c:forEach>
				</table>
			</c:if>
		</div>


		<div class="tables">
			<h3 style="color:white;">Flight Table</h3>
			<c:if test="${!empty flightList}">
				<table class="table table-striped">
					<tr>
						<th>Flight ID</th>
						<th>Start City</th>
						<th>Destination</th>
						<th>Start Time</th>
						<th>Arrive Time</th>
						<th>Ticket Price</th>
						<th>Total tickets</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${flightList}" var="flight">
						<tr class="active">
							<td>${flight.flight_id}</td>
							<input type="hidden" name="flight_id" value="${flight.flight_id}" />
							<td>${flight.start_city}</td>
							<td>${flight.destination}</td>
							<td>${flight.start_time}</td>
							<td>${flight.arrive_time}</td>
							<td>${flight.price}</td>
							<td>${flight.total_ticket}</td>
							<td><a href="#" id="${flight.flight_id}"
								onclick="deleteFlight(event)">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>