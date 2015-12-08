package coe.neu.edu.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import coe.neu.edu.web.Service.FlightService;
import coe.neu.edu.web.Service.TicketService;
import coe.neu.edu.web.Service.UserService;
import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Ticket;
import coe.neu.edu.web.model.ChosenFlights;
import coe.neu.edu.web.model.User;

@Controller
public class TicketController {

	@Autowired
	TicketService ticketService;

	@Autowired
	FlightService flightService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "bookTrip/flightDetail")
	public String bookTicket(@ModelAttribute ChosenFlights chosenFlights,
			Model model) {
		//
		// Ticket ticket = new Ticket();
		// System.out.println("aaaaa");
		// Authentication authentication = SecurityContextHolder.getContext()
		// .getAuthentication();
		// String username = authentication.getName();
		// User user = userService.getUser(username);
		// ticket.setUser(user);
		// String flight_id = request.getParameter("flight_id");
		// int id = Integer.parseInt(flight_id);
		// int ticket_id = (int) Math.random();
		// ticket.setTicket_id(ticket_id);
		if (chosenFlights.getChosenFlights().length == 1) {
			for (int i = 0; i < chosenFlights.getChosenFlights().length; i++) {
				Ticket ticket = new Ticket();
				System.out.println("aaaaa");
				Authentication authentication = SecurityContextHolder
						.getContext().getAuthentication();
				String username = authentication.getName();
				User user = userService.getUser(username);
				ticket.setUser(user);
				Flight flight = flightService.searchFlighById(chosenFlights
						.getChosenFlights()[i]);
				ticket.setFlight(flight);
				ticket.setPrice(flight.getPrice());
				ticket.setPayment("Unpaid");
				ticketService.createTicket(ticket);

				List<Ticket> tickets = new ArrayList<Ticket>();
				tickets.add(ticket);
				model.addAttribute("tickets", tickets);

				return "ticketDetail";
			}
		} else {
			model.addAttribute("message",
					"Incorrect selection, you are expected to select only one flight...");
			return "redirect:/bookTrip/all";
		}
		
		return "";
		// flightService.updateFlight(flight_id, ticket);
		// List<Ticket> tickets = new ArrayList<Ticket>();
		// tickets.add(ticket);
		// model.addAttribute("tickets", tickets);
		// } else if (chosenFlights.getChosenFlights().length == 2) {
		// Ticket oneway_ticket = new Ticket();
		// Ticket return_ticket = new Ticket();
		// System.out.println("aaaaa");
		// Authentication authentication = SecurityContextHolder.getContext()
		// .getAuthentication();
		// String username = authentication.getName();
		// User user = userService.getUser(username);
		// oneway_ticket.setUser(user);
		// return_ticket.setUser(user);
		// Flight oneway_flight = flightService.searchFlighById(chosenFlights
		// .getChosenFlights()[0]);
		// oneway_ticket.setFlight(oneway_flight);
		// oneway_ticket.setPrice(oneway_flight.getPrice());
		// ticketService.createTicket(oneway_ticket);
		//
		// Flight return_flight = flightService.searchFlighById(chosenFlights
		// .getChosenFlights()[1]);
		// oneway_ticket.setFlight(return_flight);
		// oneway_ticket.setPrice(return_flight.getPrice());
		// ticketService.createTicket(return_ticket);
		// // flightService.updateFlight(flight_id, ticket);
		//
		// // Tickets tickets =new Tickets();
		// // tickets.getChosenTickets().add(oneway_ticket);
		// // tickets.getChosenTickets().add(return_ticket);
		// List<Ticket> tickets = new ArrayList<Ticket>();
		// tickets.add(oneway_ticket);
		// tickets.add(return_ticket);
		// model.addAttribute("tickets", tickets);
		//
		// } else {
		// model.addAttribute("message", "Invalid Selection!");
		// return "redirect:/searchFlights";
		// }
	}

	@RequestMapping(value = "bookTrip/confirmTicket")
	public String confirmTicket(int ticket_id) {
		Ticket ticket = ticketService.searchTicketById(ticket_id);
		ticketService.updateTicket(ticket);
		return "success";
	}
	
	@RequestMapping(value = "bookTrip/{ticket_id}", method = RequestMethod.DELETE)
	public @ResponseBody String deleteFlight(@PathVariable int ticket_id) {
		ticketService.returnTicket(ticket_id);
		return "redirect:/myTrip";
	}
}
