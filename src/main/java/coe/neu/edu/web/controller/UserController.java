package coe.neu.edu.web.controller;

import java.util.List;

import javax.jws.WebParam.Mode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import coe.neu.edu.web.Service.FlightService;
import coe.neu.edu.web.Service.TicketService;
import coe.neu.edu.web.Service.UserService;
import coe.neu.edu.web.model.Ticket;

@Controller
@RequestMapping
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	FlightService flightService;

	@Autowired
	TicketService ticketService;
	
	@RequestMapping(value = "login/admin", method = RequestMethod.GET)
	public String welcomeAdmin(ModelMap model) {

		model.addAttribute("message", "Spring Security - ROLE_ADMIN");
		return "admin";

	}

	@RequestMapping(value = "admin/viewHistory", method = RequestMethod.DELETE)
	public @ResponseBody String deleteFlight(@PathVariable int user_id) {
		userService.deleteUser(user_id);
		return "redirect:/admin";
	}

	@RequestMapping(value = "admin/viewHistory", method = RequestMethod.GET)
	public String viewHistory(int user_id, Model model) {
		List<Ticket> tickets = ticketService.searchTicketByUser(user_id);
		model.addAttribute("tickets", tickets);
		return "history";
	}

}
