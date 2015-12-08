<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flights Result</title>

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
		<form:form commandName="chosenflights"
			action="${pageContext.request.contextPath}/bookTrip/flightDetail"
			method="post">
			<c:if test="${!empty flights}">
				<h3 style="color:white;">Search Results</h3>
				<div class="tables">
				<table class="table table-striped">
					<tr>
						<th></th>
						<th>Flight ID</th>
						<th>Start City</th>
						<th>Destination</th>
						<th>Start Time</th>
						<th>Arrive Time</th>
						<th>Ticket Price</th>
						<th>Total tickets</th>
					</tr>
					<c:forEach items="${flights}" var="flight">
						<tr class="active">
							<td><form:checkbox path="chosenFlights"
									value="${flight.flight_id}"></form:checkbox></td>
							<td><label>${flight.flight_id}</label></td>
							<input type="hidden" name="flight_id" value="${flight.flight_id}" />
							<td><label>${flight.start_city} </label></td>
							<%-- <input type="hidden" name="start_city"
							value="${flight.start_city}"> --%>
							<td><label> ${flight.destination} </label></td>
							<%-- <input type="hidden" name="destination"
							value="${flight.destination}"> --%>
							<td><label> ${flight.start_time}</label></td>
							<%-- <input type="hidden" name="start_time"
							value="${flight.start_time}"> --%>
							<td><label>${flight.arrive_time}</label></td>
							<%-- <input type="hidden" name="arrive_time"
							value="${flight.arrive_time}"> --%>
							<td><label>${flight.price}</label></td>
							<%-- 						<input type="hidden" name="price" value="${flight.price}" />
 --%>
							<td><label>${flight.total_ticket}</label></td>
							<%-- <input type="hidden" name="total_ticket"
							value="${flight.total_ticket}" /> --%>
						</tr>
					</c:forEach>
					</table>
			</c:if>
			</div>
	
	<c:if test="${!empty message}">
	<h3>${message}</h3>
	</c:if>
			<%-- <c:if test="${!empty returnFlights}">
				
					<tr>
						<th></th>
						<th>Flight ID</th>
						<th>Start City</th>
						<th>Destination</th>
						<th>Start Time</th>
						<th>Arrive Time</th>
						<th>Ticket Price</th>
						<th>Total tickets</th>
					</tr>
					<c:forEach items="${returnFlights}" var="returnFlight">
						<tr class="active">
							<td><form:checkbox path="chosenFlights"
									value="${returnFlight.flight_id}"></form:checkbox></td>
							<td><label>${returnFlight.flight_id}</label></td>
							<input type="hidden" name="flight_id"
								value="${returnFlight.flight_id}" />
							<td><label>${returnFlight.start_city} </label></td>
							<input type="hidden" name="start_city"
								value="${returnFlight.start_city}">
							<td><label> ${returnFlight.destination} </label></td>
							<input type="hidden" name="destination"
								value="${returnFlight.destination}">
							<td><label> ${returnFlight.start_time}</label></td>
							<input type="hidden" name="start_time"
								value="${returnFlight.start_time}">
							<td><label>${returnFlight.arrive_time}</label></td>
							<input type="hidden" name="arrive_time"
								value="${returnFlight.arrive_time}">
							<td><label>${returnFlight.price}</label></td>
							<input type="hidden" name="price" value="${returnFlight.price}" />
							<td><label>${returnFlight.total_ticket}</label></td>
							<input type="hidden" name="total_ticket"
								value="${returnFlight.total_ticket}" />
						</tr>
					</c:forEach>
				</table>
			</c:if> --%>
			<br />
			<input value="Select" type="submit"
				class="btn btn-primary btn-lg active" />
		</form:form>
	</div>
</body>
</html>