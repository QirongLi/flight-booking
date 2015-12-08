<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="resources/external/jquery-ui.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-color: #236B8E;
	background-image: url("resources/images/delta.jpg");
	background-repeat: no-repeat;
	background-position: center top;
	font: Verdana;
}

#wrapper {
	width: 1050px;
	margin: 0 auto;
	padding: 5px;
}

header,section {
	clear: both;
}

section {
	position: absolute;
	top: 165px;
	left: 215px;
	height: 40px;
}

#brand {
	float: left;
}

#smallmenu {
	float: right;
}

#smallmenu ul li {
	display: inline;
}

.left {
	float: left;
	background-color: #236B8E;
	color: white;
	width: 150px;
	height: 70px;
	border: 1px white solid;
	text-align: center;
	height: 60px;
	line-height: 60px;
	font-family: sans-serif;
	border-right: none;
}

.left:HOVER {
	background-color: #8B0000;
}

#mytrip_menu:HOVER{
background-color: #8B0000;
}

#booktrip_menu:HOVER{
background-color: #8B0000;
}

#vacations_menu:HOVER{
background-color: #8B0000;
}

#flightstatus_menu:HOVER{
background-color: #8B0000;
}

#checkin_menu:HOVER{
background-color: #8B0000;
}

.infoContainer {
	width: 280px;
	background-color: #FFFFFF;
	font-size: 12px;
	font-family: sans-serif;
	margin: 10px;
	padding: 10px;
}

.hidden {
	/*		clear: both;*/
	display: none;
	border: 0px;
}

#login {
	position: absolute;
	top: 85px;
	left: 215px;
	width: 301px;
	height: 80px;
	background-color: #00688B;
	border-right: 1px white solid;
	border-left: 1px white solid;
	border-top: 1px white solid;
}

.open {
	position: absolute;
	top: 225px;
	width: 301px;
	background-color: #FFFFFF;
	border: 1px white solid;
}

#mytrip {
	left: 215px;
}

#booktrip {
	left: 365px;
}

#flightstatus {
	left: 515px;
}

#checkin {
	left: 665px;
}

#vacation {
	left: 815px;
}

.hidden_menu_div {
	display: none;
	border-left: 0px;
	background-color: #8B0000;
}

#vacations_menu {
	border-right: 1px white solid;
}

.search_left,.search_right {
	float: left;
	width: 120px;
	padding: 5px;
}

.search_left {
	clear: left;
}

.search_middle {
	float: left;
	width: 20px;
}

.inside_book_flight {
	margin-top: 10px;
	margin-bottom: 10px;
}

#passenger {
	line-height: 3em;
}

#others {
	position: absolute;
	top: 780px;
	color: white;
	padding-right: 50px;
	padding-bottom: 20px;
	margin-right: 50px;
}

#news {
	float: left;
	width: 650px;
}

#fare_specials {
	float: left;
	width: 400px;
}

footer {
	position: absolute;
	top: 1450px;
	color: white;
	padding-right: 50px;
	padding-bottom: 20px;
	margin-right: 50px;
	background-color: #00688B;
	width: 100%;
}

.login_left,.login_right {
	float: left;
	width: 50px;
	padding: 2px;
	padding-left: 7px;
}

.login_hidden {
	position: absolute;
	top: 85px;
	left: 515px;
	width: 301px;
	height: 80px;
	background-color: #00688B;
	border-right: 1px white solid;
	border-left: 1px white solid;
	border-top: 1px white solid;
}

.error{
color: red;
}
</style>

<script>
	$(document)
			.ready(
					function() {

						$("#mytrip_menu")
								.click(
										function() {
											var mytrip = $("#mytrip_hidden_div");
											var mytrip_div = $("#mytrip");
											var mytrip_menu = $("#mytrip_menu");

											mytrip.animate({
												width : 'toggle'
											});

											$(document)
													.mouseup(
															function(e) {
																if (!mytrip
																		.is(e.target)
																		&& mytrip
																				.has(e.target).length === 0
																		&& !mytrip_div
																				.is(e.target)
																		&& mytrip_div
																				.has(e.target).length === 0) {
																	mytrip
																			.hide();
																	mytrip_div
																			.hide();
																}
															});

											if (mytrip_div.hasClass('hidden')) {
												mytrip_div
														.removeClass('hidden');
												mytrip_div.addClass('open');
												mytrip_div.slideDown(1000);
												mytrip.show();
												mytrip_menu.css("background-color","#8B0000");
												return false;
											} else {
												mytrip_div.removeClass('open');
												mytrip_div.addClass('hidden');
												mytrip_div.slideUp(500);
												mytrip.hide();
												mytrip_menu.css("background-color","#236B8E");
												return false;
											}
											;

										});

						$("#booktrip_menu")
								.click(
										function() {
											var booktrip = $("#booktrip_hidden_div");
											var booktrip_div = $("#booktrip");
											var datepicker = $("#ui-datepicker-div");
											var booktrip_menu = $("#booktrip_menu");

											booktrip.animate({
												width : 'toggle'
											});

											$(document)
													.mouseup(
															function(e) {
																if (!booktrip
																		.is(e.target)
																		&& booktrip
																				.has(e.target).length === 0
																		&& !booktrip_div
																				.is(e.target)
																		&& booktrip_div
																				.has(e.target).length === 0
																		&& !datepicker
																				.is(e.target)
																		&& datepicker
																				.has(e.target).length === 0) {
																	booktrip_div
																			.hide();
																	booktrip
																			.hide();
																}
															});

											if (booktrip_div.hasClass('hidden')) {
												booktrip_div
														.removeClass('hidden');
												booktrip_div.addClass('open');
												booktrip_div.slideDown(1000);
												booktrip.show();
												booktrip_menu.css("background-color","#8B0000");
												return false;
											} else {
												booktrip_div
														.removeClass('open');
												booktrip_div.addClass('hidden');
												booktrip_div.slideUp(500);
												booktrip.hide();
												booktrip_menu.css("background-color","#236B8E");
												return false;
											}
											;

										});

						$("#flightstatus_menu")
								.click(
										function() {
											var flightstatus = $("#flightstatus_hidden_div");
											var flightstatus_div = $("#flightstatus");
											var flight_menu = $("#flightstatus_menu");

											flightstatus.animate({
												width : 'toggle'
											});

											$(document)
													.mouseup(
															function(e) {
																if (!flightstatus
																		.is(e.target)
																		&& flightstatus
																				.has(e.target).length === 0
																		&& !flightstatus_div
																				.is(e.target)
																		&& flightstatus_div
																				.has(e.target).length === 0) {
																	flightstatus_div
																			.hide();
																	flightstatus
																			.hide();
																}
															});

											if (flightstatus_div
													.hasClass('hidden')) {
												flightstatus_div
														.removeClass('hidden');
												flightstatus_div
														.addClass('open');
												flightstatus_div
														.slideDown(1000);
												flightstatus.show();
												flight_menu.css("background-color","#8B0000");
												return false;
											} else {
												flightstatus_div
														.removeClass('open');
												flightstatus_div
														.addClass('hidden');
												flightstatus_div.slideUp(500);
												flightstatus.hide();
												flight_menu.css("background-color","#236B8E");
												return false;
											}
											;
										});

						$("#checkin_menu")
								.click(
										function() {
											var checkin = $("#checkin_hidden_div");
											var checkin_div = $("#checkin");
											var check_menu = $("#checkin_menu");

											checkin.animate({
												width : 'toggle'
											});

											$(document)
													.mouseup(
															function(e) {
																if (!checkin
																		.is(e.target)
																		&& checkin
																				.has(e.target).length === 0
																		&& !checkin_div
																				.is(e.target)
																		&& checkin_div
																				.has(e.target).length === 0) {
																	checkin
																			.hide();
																	checkin_div
																			.hide();
																}
															});

											if (checkin_div.hasClass('hidden')) {
												checkin_div
														.removeClass('hidden');
												checkin_div.addClass('open');
												checkin_div.slideDown(1000);
												checkin.show();
												check_menu.css("background-color","#8B0000");
												return false;
											} else {
												checkin_div.removeClass('open');
												checkin_div.addClass('hidden');
												checkin_div.slideUp(500);
												checkin.hide();
												check_menu.css("background-color","#236B8E");
												return false;
											}
											;
										});

						$("#vacations_menu")
								.click(
										function() {
											var vacation = $("#vacations_hidden_div");
											var vacation_div = $("#vacation");
											var vacation_menu = $("#vacations_menu");

											vacation.animate({
												width : 'toggle'
											});

											$(document)
													.mouseup(
															function(e) {
																if (!vacation
																		.is(e.target)
																		&& vacation
																				.has(e.target).length === 0
																		&& !vacation_div
																				.is(e.target)
																		&& vacation_div
																				.has(e.target).length === 0) {
																	vacation
																			.hide();
																	vacation_div
																			.hide();
																}
															});

											if (vacation_div.hasClass('hidden')) {
												vacation_div
														.removeClass('hidden');
												vacation_div.addClass('open');
												vacation_div.slideDown(1000);
												vacation.show();
												vacation_menu.css("background-color","#8B0000");
												return false;
											} else {
												vacation_div
														.removeClass('open');
												vacation_div.addClass('hidden');
												vacation_div.slideUp(500);
												vacation.hide();
												vacation_menu.css("background-color","#236B8E");
												return false;
											};

										});

					});
</script>

</head>
<body>
	<div id="wrapper">
		<header>
			<div id="brand">
				<img src="resources/images/logo.jpg" />
			</div>
			<div id="smallmenu" style="font-size: 10px;">
				<ul>
					<li><a href="#">ENGLISH</a></li>|
					<li><a href="#">SUPPORT</a></li>|
					<li><a href="#">COMMENT/COMPLAINT?</a></li>|
					<li><a href="#">TEXT ONLY</a></li>
				</ul>
				<ul>
					<li><a href="#">SHOP</a></li>|
					<li><a href="#">TRAVELING WITH US</a></li>|
					<li><input type="text" name="searcharea" /></li>|
					<li><input type="submit" name="search" value="Search"
						style="background-color: #00688B; text: white;"></li>
				</ul>
			</div>
		</header>

		<section>
			<div id="mytrip_menu" class="left">MY TRIPS</div>
			<div id="mytrip_hidden_div" class="left hidden_menu_div"></div>

			<div id="booktrip_menu" class="left">BOOK A TRIP</div>
			<div id="booktrip_hidden_div" class="left hidden_menu_div"></div>

			<div id="flightstatus_menu" class="left">FLIGHT STATUS</div>
			<div id="flightstatus_hidden_div" class="left hidden_menu_div"></div>

			<div id="checkin_menu" class="left">CHECK IN</div>
			<div id="checkin_hidden_div" class="left hidden_menu_div"></div>

			<div id="vacations_menu" class="left">VACATIONS</div>
			<div id="vacations_hidden_div" class="left hidden_menu_div"></div>
		</section>

		<div id="login">
			<sec:authorize access="isAuthenticated()">
				<h4 style="text: white;">
					Welcome!
					<sec:authentication property="principal.username" />
				</h4>
				<a href="<c:url value="j_spring_security_logout" />"> Logout</a>
			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<form id="login_form" class="form-inline" role="form" name='f'
					action='http://localhost:8080/edu/j_spring_security_check'
					method='POST'>

					<p style="line-height: 10px; color: white; padding-top: 5px;">
						&nbsp; Login with Username and Password.</p>
						<p style="line-height: 10px; color: white;">&nbsp; No accout?
						<a href="${pageContext.request.contextPath}/register">Sign up!</a></p>
					<div class="login_left" style="width: 50px;">
						<input id="login_username" type='text' name='j_username' value=''
							placeholder="Username" style="width: 100px;" />
					</div>
					<div class="search_middle">&nbsp;</div>
					<div class="login_right"
						style="width: 50px; position: absolute; left: 110px;">
						<input id="login_password" type='password' name='j_password'
							placeholder="Password" style="width: 100px;" />
					</div>
					<div style="position: absolute; left: 225px; padding: 2px;">
						<input name="submit" type="submit" value="Login"
							style="width: 50px;" />
					</div>
				</form>
			</sec:authorize>
		</div>

		<div>
			<sec:authorize access="isAnonymous()">
				<div id="no_username_error" class="login_hidden hidden" style="color:white;padding-top:10px;">
					<p style="color:white">&nbsp;&nbsp;&nbsp;Please enter username.</p>
				</div>

				<div id="no_password_error" class="login_hidden hidden" style="color:white;">
					<p style="color:white">&nbsp;&nbsp;&nbsp;Please enter password.</p>
				</div>
			</sec:authorize>
		</div>

		<div id="mytrip" class="hidden">
			<div class="infoContainer">

			<sec:authorize access="isAuthenticated()">
				<h4 style="text: white;">
					Welcome!
					<sec:authentication property="principal.username" />
				</h4>
				<a href="<c:url value="j_spring_security_logout" />"> Logout</a>
				<form action="${pageContext.request.contextPath}/myTrip" method="get">
				<input type="submit" value="View My History">
				</form>
			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<label><h3>FIND MY TRIP</h3></label>
				<fieldset>
					<div>
						<select id="search_way" class="form-control">
							<option selected="selected" value="comfirmation">Confirmation
								Number</option>
							<option value="ticket">Ticket Number</option>
						</select> <br />
						<div id="comfirmationOPtion">
							<form>
								<label class="control-label">FIRST NAME</label><br /> <input
									class="form-control" type="text" name="fname" /><br /> <label
									class="control-label">LAST NAME</label><br /> <input
									class="form-control" type="text" name="lname" /><br />
								<div id="comfirmation">
									<label class="control-label">CONFIRMATION NUMBER</label><br />
									<input class="form-control" type="text" name="confirmationNo"
										placeholder="Flight comfirmation number" /><br />
								</div>
								<div id="ticket" class="hidden">
									<label class="control-label">TICKET NUMBER</label><br /> <input
										class="form-control" type="text" name="ticketNo"
										placeholder="Ticket number" /><br />
								</div>
								<input type="submit" class="btn btn-primary btn-lg btn-block"
									name="findmytrip" value="FIND MY TRIP" />
							</form>
						</div>
					</div>
				</fieldset>
				</sec:authorize>
			</div>
		</div>

		<!-- 		<div class="carousel">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel"
				style="width: 200px; height: 100px;position: absolute; top: 500px; left:700px;">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">

					<div class="item active">
						<img src="resources/images/pillows.png">
					</div>
					<div class="item">
						<img src="resources/images/temple-statue.png" />
					</div>
					<div class="item">
						<img src="resources/images/airplane.png.jpg" />
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-example-generic"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div> -->

		<div id="booktrip" class="hidden">
			<div class="infoContainer">
				<div id="some_city_error" class="hidden">
					<p class="error">Please enter different arrival and departure
						cities.</p>
				</div>

				<div id="from_city_empty_error" class="hidden">
					<p class="error">Please enter a valid 'FROM' City or Airport
						code.</p>
				</div>

				<div id="to_city_empty_error" class="hidden">
					<p class="error">Please enter a valid 'TO' City or Airport
						code.</p>
				</div>

				<div id="from_time_empty_error" class="hidden">
					<p class="error">Please enter a valid Departure Date.</p>
				</div>

				<div id="to_time_empty_error" class="hidden">
					<p class="error">Please enter a valid Return Date.</p>
				</div>

				<div id="passenger_no_error" class="hidden">
					<p class="error">Please enter a valid passenger number.</p>
				</div>

				<br />
				<div class="tripchoices" style="text-align: center;">
					<button id="roundtrip" type="button" class="btn btn-primary"
						style="width: 100px;">Round Trip</button>
					<button id="oneway" type="button" class="btn btn-primary"
						style="width: 100px;">One Way</button>
				</div>
				<br />
				<fieldset>
					<form id="searchform"
						action="http://localhost:8080/edu/bookTrip/all" method="get">
						<div id="from_to_label">
							<div class="search_left">
								<label class="control-label">FROM</label>
							</div>
							<div class="search_middle">&nbsp;</div>
							<div class="search_right" class="control-label">
								<label>TO</label>
							</div>
						</div>

						<br />

						<div id="from_to_text" style="height: 50px;">
							<div class="search_left">
								<input id="start_city" type="text" class="form-control"
									name="start_city" />
							</div>
							<div class="search_middle">&nbsp;</div>
							<div class="search_right">
								<input id="to_city" type="text" class="form-control"
									name="destination" />
							</div>
						</div>

						<br />

						<div class="inside_book_flight" style="height: 50px;">
							<div class="search_left">
								<input type="text" id="depart_date" class="form-control"
									name="start_time" placeholder="Depart date" />
							</div>
							<div class="search_middle">&nbsp;</div>
							<div class="search_right">
								<input type="text" id="return_date" class="form-control"
									name="arrive_time" placeholder="Return date" />
							</div>
						</div>

						<div class="inside_book_flight" style="height: 50px;">
							<div id="passenger"
								style="float: left; width: 120px; padding: 0px; height: 20px;">
								<label class="control-label"
									style="margin-top: 10px; line-height: 60%">PASSENGERS<br />
									<br /> <span style="font-size: 70%; padding: 0px;">(Please
										enter number between 1 and 9)</span></label>
							</div>
							<div class="search_middle">&nbsp;</div>
							<div class="search_right">
								<input type="text" id="passenger_number" class="form-control"
									name="passengerNo" />
							</div>
						</div>
				</fieldset>

				<div>
					<input type="submit" class="btn btn-primary btn-lg btn-block"
						name="findflights" value="FIND FLIGHTS" />
				</div>
				</form>
			</div>
		</div>

		<div id="flightstatus" class="hidden">
			<div class="infoContainer">
				<p>some information</p>
			</div>
		</div>

		<div id="checkin" class="hidden">
			<div class="infoContainer">
				<p>some information</p>
			</div>
		</div>

		<div id="vacation" class="hidden">
			<div class="infoContainer">
				<p>some information</p>
			</div>
		</div>

		<div id="others">

			<div id="news">
				<h3>NEWS TO YOU</h3>
				<div id="news_one">
					<div class="pic"
						style="float: left; margin-top: 25px; margin-right: 20px;">
						<img src="resources/images/news_one.png" />
					</div>
					<div class="words"
						style="float: left; width: 400px; margin-bottom: 25px; padding-bottom: 25px; border-bottom: 1px white solid;">
						<h4>THE EASIER-TO-REDEEM 2015 SKYMILES PROGRAM</h4>
						<p>The SkyMiles program will make Award redemption easier and
							better reward those who spend more with Delta.</p>
						<p>Starting in 2015, you’ll earn miles based on ticket price.
							Plus, you will enjoy more Award Seats for fewer miles, One-Way
							Awards and Miles + Cash Award options.</p>
					</div>
				</div>

				<div id="news_two">
					<div class="words"
						style="float: left; width: 400px; border-bottom: 1px white solid; margin-bottom: 25px; padding-bottom: 25px;">
						<h4>Upgrade to Economy Comfort™</h4>
						<p>Enjoy up to 4 more inches of legroom, Priority Boarding and
							seating in the first few rows of the Economy Class cabin. On most
							long-haul international flights you’ll also experience up to 50%
							more recline. All international routes include complimentary
							beer, wine and spirits.</p>
					</div>
					<div class="pic"
						style="float: left; margin-top: 25px; margin-left: 20px;">
						<img src="resources/images/news_two.png" />
					</div>
				</div>

				<div id="news_three" style="clear: left;">
					<div class="pic"
						style="float: left; margin-top: 10px; margin-right: 20px;">
						<img src="resources/images/news_three.png" />
					</div>
					<div class="words" style="float: left; width: 400px;">
						<h4>eGift Certificates</h4>
						<p>Give the gift of travel. See how easy it is to send a
							newlywed, graduate, or outstanding employee on their way to one
							of our 350 destinations around the world.</p>
					</div>
				</div>
			</div>

			<div
				style="border-left: 1px white solid; height: 600px; float: left; margin-top: 20px; padding-right: 50px;"></div>

			<div id="fare_specials">
				<h3>FARE SPECIALS</h3>
				<div class="pic">
					<img src="resources/images/fare.png" />
				</div>

				<div id="fare_one"
					style="width: 320px; border-bottom: 1px white solid; margin-bottom: 15px; padding-bottom: 15px;">
					<div>
						<h3>Discover the Mystique of Asia</h3>
					</div>
					<div>
						<a href="#">FROM $410*</a>
					</div>
					<div style="font-size: 12px;">
						<br />
						<p>Architectural wonders and sacred spaces abound throughout
							the diverse landscapes of Asia.</p>
					</div>
				</div>

				<div id="fare_two"
					style="width: 320px; border-bottom: 1px white solid; margin-bottom: 15px; padding-bottom: 15px;">
					<div>
						<h4>Latin America & Caribbean</h4>
					</div>
					<div>
						<a href="#">FROM $119*</a>
					</div>
				</div>

				<div id="fare_three"
					style="width: 320px; border-bottom: 1px white solid; margin-bottom: 15px; padding-bottom: 15px;">
					<div>
						<h4>Asia & Pacific Region</h4>
					</div>
					<div>
						<a href="#">FROM $410*</a>
					</div>
				</div>

				<div id="fare_four"
					style="width: 320px; border-bottom: 1px white solid; margin-bottom: 15px; padding-bottom: 15px;">
					<div>
						<h4>Flights to Europe</h4>
					</div>
					<div>
						<a href="#">FROM $486*</a>
					</div>
				</div>

				<div id="fare_five" style="width: 320px; font-size: 10px;">
					<p>*Fares displayed are each-way; round-trip purchase is
						required. Fees/restrictions/baggage fees may apply. Fares
						available on delta.com.</p>
				</div>

			</div>

		</div>
	</div>

	<footer>
		<div id="wrapper">
			<div
				style="float: left; width: 345px; padding: 20px; padding-bottom: 40px;">
				<h5>What's Happening on Facebook</h5>
				<p style="font-size: 11px;">Want to get the latest
					announcements, travel tips, and promotions from Delta? Like us on
					our Facebook page. Share your thoughts, photos, and experiences
					with Delta and our community.</p>
			</div>
			<div style="float: left; width: 350px; padding: 20px;">
				<h5>Taking Off</h5>
				<p style="font-size: 11px;">Need a little digital diversion?
					Break for our brand new blog to find virtual vistas, foodie finds,
					travel tips and more. You can even submit your own travel photos to
					share your Delta journey.</p>
			</div>
			<div
				style="float: left; width: 345px; padding-left: 20px; padding-bottom: 20px; padding-top: 20px;">
				<h5>The Ultimate Remote Control</h5>
				<p style="font-size: 11px;">Do all things Delta right from your
					smartphone or iPad. Book or change flights, check in, receive push
					alerts and more. It's like having a Red Coat in the palm of your
					hand. Find the Fly Delta app for your device.</p>
			</div>

			<div>
				<img src="" />
			</div>

			<div style="clear: both; font-size: 10px; line-height: 2px;">
				<p style="text-align: center;">Travel may be on other airlines.</p>
				<p style="text-align: center;">Terms and conditions apply to all
					offers and SkyMiles benefits. See specific offer for details, and
					visit SkyMiles Membership Guide & Program Rules.</p>
				<p style="text-align: center;">+Subject to government approval.</p>
			</div>
		</div>

	</footer>
	<br />



	<script src="resources/external/jquery/jquery.js"></script>
	<script src="resources/external/jquery-ui.js"></script>

	<script>
		// $( "#depart_date" ).datepicker({
		// 	minDate: 0,
		// 	inline: true
		// });

		// $( "#return_date" ).datepicker({
		// 	minDate: 0,
		// 	inline: true
		// });

		/* global setting */
		var one_way_selected = false;

		var datepickersOpt = {
			dateFormat : 'dd-mm-yy',
			minDate : 0
		}

		$("#depart_date").datepicker($.extend({
			onSelect : function() {
				var minDate = $(this).datepicker('getDate');
				minDate.setDate(minDate.getDate() + 1); //add two days
				$("#return_date").datepicker("option", "minDate", minDate);
			}
		}, datepickersOpt));

		$("#return_date").datepicker($.extend({
			onSelect : function() {
				var maxDate = $(this).datepicker('getDate');
				maxDate.setDate(maxDate.getDate() - 2);
				$("#depart_date").datepicker("option", "maxDate", maxDate);
			}
		}, datepickersOpt));

		$("#search_way").change(function() {
			$('#comfirmation, #ticket').hide();
			if ($('#search_way option:selected').val() == 'ticket') {
				$('#ticket').removeClass("hidden");
			}
			;
			$('#' + $('#search_way option:selected').val()).show();
		});

		$("#roundtrip").click(function() {
			$("#return_date").show();
		});

		$("#oneway").click(function() {
			$("#return_date").hide();
			one_way_selected = true;
		});

		$('#searchform').submit(
				function(event) {
					var start_city = $('#start_city').val();
					var to_city = $('#to_city').val();
					var start_time = $('#depart_date').val();
					var return_time = $('#return_date').val();

					if ($.trim(start_city).length > 0
							&& $.trim(to_city).length > 0
							&& start_city == to_city) {
						$('#some_city_error').removeClass("hidden");
						event.preventDefault();
					} else {
						$('#some_city_error').addClass("hidden");
					}
					;

					if ($.trim(start_city).length == 0) {
						$('#from_city_empty_error').removeClass("hidden");
						event.preventDefault();
					} else {
						$('#from_city_empty_error').addClass("hidden");
					}
					;

					if ($.trim(to_city).length == 0) {
						$('#to_city_empty_error').removeClass("hidden");
						event.preventDefault();
					} else {
						$('#to_city_empty_error').addClass("hidden");
					}
					;

					if ($.trim(start_time).length == 0) {
						$('#from_time_empty_error').removeClass("hidden");
						event.preventDefault();
					} else {
						$('#from_time_empty_error').addClass("hidden");
					}
					;

					if ($.trim(return_time).length == 0) {
						$('#to_time_empty_error').removeClass("hidden");
						event.preventDefault();
					} else {
						$('#to_time_empty_error').addClass("hidden");
					}
					;

				});

		$('#login_form').submit(function(event) {
			var username = $('#login_username').val();
			var password = $('#login_password').val();

			if ($.trim(username) == 0) {
				$('#no_username_error').removeClass("hidden");
				event.preventDefault();
			} else {
				$('#no_username_error').addClass("hidden");
			}
			;

			if ($.trim(password) == 0) {
				$('#no_password_error').removeClass("hidden");
				event.preventDefault();
			} else {
				$('#no_password_error').addClass("hidden");
			}
			;
		});
	</script>
</body>
</html>