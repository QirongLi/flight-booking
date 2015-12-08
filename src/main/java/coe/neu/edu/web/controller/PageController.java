package coe.neu.edu.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.wimpi.telnetd.io.terminal.ansi;

import org.codehaus.jackson.map.SerializationConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import coe.neu.edu.web.Service.FlightService;
import coe.neu.edu.web.Service.TicketService;
import coe.neu.edu.web.Service.UserService;
import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.FlightsIOS;
import coe.neu.edu.web.model.Login;
import coe.neu.edu.web.model.Role;
import coe.neu.edu.web.model.Ticket;
import coe.neu.edu.web.model.User;

@Controller
public class PageController {

	@Autowired
	UserService userService;
	@Autowired
	FlightService flightService;
	@Autowired
	TicketService ticketService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/myTrip", method = RequestMethod.GET)
	public String showMyTripPage(Model model) {
		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = authentication.getName();
		User user = userService.getUser(username);
		model.addAttribute("ticketList",
				ticketService.searchTicketByUser(user.getUser_id()));
		return "myTrip";
	}

	@RequestMapping(value = "/bookTrip", method = RequestMethod.GET)
	public String showBookTripPage(Model model) {
		// model.addAttribute("user", userService.getUser(username));
		model.addAttribute("flight", new Flight());
		return "bookTrip";
	}

	@RequestMapping(value = "/flightStatus", method = RequestMethod.GET)
	public String showFlightStatusPage() {
		return "flightStatus";
	}

	@RequestMapping(value = "/manageFlight", method = RequestMethod.GET)
	public String showAddFlightPage(Model model) {
		model.addAttribute("flight", new Flight());
		return "manageFlight";
	}

	@RequestMapping(value = "/manageUser", method = RequestMethod.GET)
	public String showAddUserPage(Model model) {
		model.addAttribute("user", new User());
		return "manageUser";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterPage(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@RequestMapping(value = "/dispatch", method = RequestMethod.GET)
	public String dispatch(Model model) {
		Set<String> roles = AuthorityUtils
				.authorityListToSet(SecurityContextHolder.getContext()
						.getAuthentication().getAuthorities());
		if (roles.contains("ROLE_ADMIN")) {
			model.addAttribute("user", new User());
			model.addAttribute("flight", new Flight());
			model.addAttribute("userList", userService.allUser());
			model.addAttribute("flightList", flightService.allFlight());
			return "admin";
		}
		return "home";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/ios/login", method = RequestMethod.POST)
	public @ResponseBody User showIOSLoginPage(
			@RequestBody Map<String, String> input) {
		System.out.println(input);
		String username = input.get("username");
		String password = input.get("password");
		for (User user : userService.allUser()) {
			if (user.getUsername().equals(username)
					&& user.getPassword().equals(password)) {
				
				return user;

			}
		}
		return null;
	}

	@RequestMapping(value = "/ios/allFlights", method = RequestMethod.POST)
	public @ResponseBody List<Flight> showIOSAllFlights() {
		List<Flight> flightsIOS = flightService.allFlight();
		return flightsIOS;
	}

	@RequestMapping(value = "/ios/deleteFlight", method = RequestMethod.POST)
	public @ResponseBody int deleteFlight(@RequestBody Map<String, String> input) {
		String flight_id = input.get("flight_id");
		int id = Integer.valueOf(flight_id);
		flightService.deleteFlight(id);
		return 1;
	}

	@RequestMapping(value = "/ios/addFlight", method = RequestMethod.POST)
	public @ResponseBody int addFlight(@RequestBody Map<String, String> input) {
		Flight flight = new Flight();
		flight.setStart_city(input.get("start_city"));
		flight.setDestination(input.get("destination"));
		flight.setStart_time(input.get("start_time"));
		flight.setArrive_time(input.get("arrive_time"));
		flight.setPrice(Float.valueOf(input.get("price")));
		flight.setTotal_ticket(Integer.valueOf(input.get("total_ticket")));

		flightService.addFlight(flight);
		return 1;
	}

	@RequestMapping(value = "/ios/addUser", method = RequestMethod.POST)
	public @ResponseBody int addUser(@RequestBody Map<String, String> input) {
		User user = new User();
		user.setUsername(input.get("username"));
		user.setPassword(input.get("password"));
		user.setFirstname(input.get("firstname"));
		user.setLastname(input.get("lastname"));
		user.setPhone(input.get("phone"));
		user.setEmail(input.get("email"));
		user.setAddress(input.get("address"));
		Role role = new Role();
		role.setId(2);
		role.setRole("user");
		user.setRole(role);
		userService.addUser(user);
		return 1;
	}

	@RequestMapping(value = "/ios/deleteUser", method = RequestMethod.POST)
	public @ResponseBody int deleteUser(@RequestBody Map<String, String> input) {
		String user_id = input.get("user_id");
		int id = Integer.valueOf(user_id);
		userService.deleteUser(id);
		;
		return 1;
	}

	@RequestMapping(value = "/ios/oneWayFlight", method = RequestMethod.POST)
	public @ResponseBody List<Flight> searchIOSFlights(
			@RequestBody Map<String, String> input) {
		String start_city = input.get("start_city");
		String destination = input.get("destination");
		List<Flight> flights = flightService.searchFlightByCity(start_city,
				destination);
		return flights;
	}

	@RequestMapping(value = "/ios/allUsers", method = RequestMethod.POST)
	public @ResponseBody List<User> showIOSAllUsers() {
		List<User> userIOS = userService.allUser();
		return userIOS;
	}

	@RequestMapping(value = "/ios/addTicket", method = RequestMethod.POST)
	public @ResponseBody int addTicket(@RequestBody Map<String, String> input) {
		int flight_id = Integer.valueOf(input.get("flight_id"));
		String firstname = input.get("firstname");
		for (User u : userService.allUser()) {
			if (u.getFirstname().equals(firstname)) {
				Ticket ticket = new Ticket();
				Flight flight = flightService.searchFlighById(flight_id);
				ticket.setFlight(flight);
				ticket.setPrice(flight.getPrice());
				ticket.setUser(u);
				ticket.setPayment("Paid");
				ticketService.createTicket(ticket);
				return 1;
			}
		}
		return 2;
	}
	
	@RequestMapping(value = "/ios/addUser&Ticket", method = RequestMethod.POST)
	public @ResponseBody int addUserTicket(@RequestBody Map<String, String> input) {
		User user = new User();
		user.setUsername(input.get("username"));
		user.setPassword(input.get("password"));
		user.setFirstname(input.get("firstname"));
		user.setLastname(input.get("lastname"));
		user.setPhone(input.get("phone"));
		user.setEmail(input.get("email"));
		user.setAddress(input.get("address"));
		Role role = new Role();
		role.setId(2);
		role.setRole("user");
		user.setRole(role);
		userService.addUser(user);
		
		int flight_id = Integer.valueOf(input.get("flight_id"));
		Ticket ticket = new Ticket();
		Flight flight = flightService.searchFlighById(flight_id);
		ticket.setFlight(flight);
		ticket.setPrice(flight.getPrice());
		ticket.setPayment("Paid");
		ticket.setUser(user);
		ticketService.createTicket(ticket);
		return 1;
	}
	
	@RequestMapping(value = "/ios/allTickets", method = RequestMethod.POST)
	public @ResponseBody List<Ticket> showIOSAllTickets(@RequestBody Map<String, String> input) {
		int user_id = Integer.valueOf(input.get("user_id"));
		List<Ticket> ticketIOS = ticketService.searchTicketByUser(user_id);
//		List<Integer> ticketIDs = new ArrayList<Integer>();
//		for (int i = 0; i<ticketIOS.size();i++) {
//			Ticket ticket = ticketIOS.get(i);
//			ticketIDs.add(ticket.getTicket_id());
//		}
		return ticketIOS;
	}
	
	@RequestMapping(value = "/ios/findTicket", method = RequestMethod.POST)
	public @ResponseBody Map<String,String> findTicket(@RequestBody Map<String, String> input) {
		int ticket_id = Integer.valueOf(input.get("ticket_id"));
		Ticket ticket = ticketService.searchTicketById(ticket_id);
		System.out.println(ticket.getFlight().getStart_city());
		
		Map<String,String> returnMap = new HashMap<String,String>();
		
		Flight flight = flightService.searchFlighById(ticket.getFlight().getFlight_id());
		returnMap.put("ticketId", String.valueOf(ticket_id));
		returnMap.put("flight_id", String.valueOf(flight.getFlight_id()));
		returnMap.put("start_city", flight.getStart_city());
		returnMap.put("start_time", flight.getStart_time());
		returnMap.put("destination", flight.getDestination());
		returnMap.put("arrive_time", flight.getArrive_time());
		returnMap.put("payment", ticket.getPayment());
		returnMap.put("price", String.valueOf(ticket.getPrice()));
		return returnMap;
	}
	
//	@RequestMapping(value = "/webdesign/searchflights", method = RequestMethod.GET)
//	public String 
}
