<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</head>
<body>
	<div class="container">
		<br />
		<h3>Ticket Table</h3>
		<br />
		<form:form commandName="chosenflights"
			action="${pageContext.request.contextPath}/bookTrip/confirmTicket"
			method="post">
		<table class="table table-striped">
			<tr>
				<td>Ticket ID</td>
				<td>Flight Id</td>
				<td>Price</td>
				<td>Start Time</td>
				<td>Arrive Time</td>
			</tr>
			<c:forEach items="${tickets}" var="ticket">
				<tr>
					<td>${ticket.ticket_id}</td>
					<input type="hidden" name="ticket_id" value="${ticket.ticket_id}" />
					<td>${ticket.flight.flight_id}</td>
					<td>${ticket.price}</td>
					<td>${ticket.flight.start_time}</td>
					<td>${ticket.flight.arrive_time}</td>
				</tr>
			</c:forEach>
		</table>
		<input value="Buy!" type="submit" class="btn btn-primary btn-lg active" />
		</form:form>
	</div>
</body>
</html>