<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
	
</script>
<script>
	$(document).ready(function() {
		$("#hide").click(function() {
			$("#hidden1").hide();
			$("#hidden2").hide();
			$("p").hide();
		});
		$("#show").click(function() {
			$("#hidden1").show();
			$("#hidden2").show();
			$("p").show();
		});
	});
</script>

<script type="text/javascript">
	$('.datepicker').datepicker();
</script>

</head>
<body>
	<div class="container">
		<br>
		<!-- 	<button id="hide" class="btn btn-primary btn-lg active">One-way
		Trip</button>
	<button id="show" class="btn btn-primary btn-lg active">Round
		Trip</button>

	<br /> -->
		<h3>Please enter your search...</h3>
		<form:form modelAttribute="flight" class="form-inline"
			action="${pageContext.request.contextPath}/bookTrip/all" method="get">
			<br>
			<div class="form-group">
				<form:label path="start_city" class="sr-only">Start City:</form:label>
				<form:input path="start_city" class="form-control"
					placeholder="Enter Start City" />
			</div>
			<div class="form-group">
				<form:label path="destination" class="sr-only">Destination:</form:label>
				<form:input path="destination" class="form-control"
					placeholder="Enter Destination" />
			</div>
			<%-- 		<br>
		<br>
		<div class="form-group">
			<form:label path="start_time" class="sr-only">Depart Date</form:label>
			<form:input path="start_time" class="form-control"
				placeholder="Enter Start Time" />
		</div>
		<div class="form-group">
			<p id="hidden1">
				<form:label path="arrive_time" class="sr-only">Return Date</form:label>
			</p>
			<p id="hidden2">
				<form:input path="arrive_time" class="form-control"
					placeholder="Enter Arrive Time" />
			</p>
		</div> --%>
			<br>
			<br>
			<div class="form-group">
				<input value="Search" type="submit"
					class="btn btn-primary btn-lg active" />
			</div>
		</form:form>

		
			<c:out value="${message}"></c:out>


		<c:if test="${!empty flights}">
			<table class="table table-striped">
				<tr>
					<th>Flight ID</th>
					<th>Start City</th>
					<th>Destination</th>
					<th>Start Time</th>
					<th>Arrive Time</th>
					<th>Ticket Price</th>
					<th>Total tickets</th>
				</tr>
				<c:forEach items="${flights}" var="flight">
					<form
						action="${pageContext.request.contextPath}/bookTrip/flightDetail"
						method="post" commandName="flight">
						<tr>
							<td><label>${flight.flight_id}</label></td>
							<input type="hidden" name="flight_id" value="${flight.flight_id}" />
							<td><label>${flight.start_city} </label></td>
							<input type="hidden" name="start_city"
								value="${flight.start_city}">
							<td><label> ${flight.destination} </label></td>
							<input type="hidden" name="destination"
								value="${flight.destination}">
							<td><label> ${flight.start_time}</label></td>
							<input type="hidden" name="start_time"
								value="${flight.start_time}">
							<td><label>${flight.arrive_time}</label></td>
							<input type="hidden" name="arrive_time"
								value="${flight.arrive_time}">
							<td><label>${flight.price}</label></td>
							<input type="hidden" name="price" value="${flight.price}" />
							<td><label>${flight.total_ticket}</label></td>
							<input type="hidden" name="total_ticket"
								value="${flight.total_ticket}" />

							<%-- 	<td><a href="#" id="${flight.flight_id}"
							onclick="getTicket(event)">Select</a></td>
 --%>
							<td><input value="Select" type="submit"
								class="btn btn-primary btn-lg active" /></td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</c:if>

		<%-- <p>
			<c:if test="${!empty flights}">
				<label> Return Flight </label>
				<table class="data">
					<tr>
						<th>Flight ID</th>
						<th>Start City</th>
						<th>Destination</th>
						<th>Start Time</th>
						<th>Arrive Time</th>
						<th>Ticket Price</th>
						<th>Total tickets</th>
					</tr>
					<c:forEach items="${returnFlights}" var="flight">
						<form id="ticket"
							action="${pageContext.request.contextPath}/bookTrip/flightDetail"
							method="post">
							<tr>
								<td><label>${flight.flight_id}</label></td>
								<input type="hidden" name="flight_id"
									value="${flight.flight_id}" />
								<td><label>${flight.start_city} </label></td>
								<input type="hidden" name="start_city"
									value="${flight.start_city}">
								<td><label> ${flight.destination} </label></td>
								<input type="hidden" name="destination"
									value="${flight.destination}">
								<td><label> ${flight.start_time}</label></td>
								<input type="hidden" name="start_time"
									value="${flight.start_time}">
								<td><label>${flight.arrive_time}</label></td>
								<input type="hidden" name="arrive_time"
									value="${flight.arrive_time}">
								<td><label>${flight.price}</label></td>
								<input type="hidden" name="price" value="${flight.price}" />
								<td><label>${flight.total_ticket}</label></td>
								<input type="hidden" name="total_ticket"
									value="${flight.total_ticket}" />

									<td><a href="#" id="${flight.flight_id}"
							onclick="getTicket(event)">Select</a></td>

								<td><input value="Select" type="submit" /></td>
							</tr>
						</form>
					</c:forEach>
				</table>
			</c:if>
		</p> --%>
	</div>
</body>
</html>