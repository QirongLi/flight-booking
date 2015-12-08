package coe.neu.edu.web.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import coe.neu.edu.web.Service.FlightService;
import coe.neu.edu.web.Service.UserService;
import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Role;
import coe.neu.edu.web.model.User;

@Controller
@RequestMapping
public class AddController {

	@Autowired
	UserService userService;

	@Autowired
	FlightService flightService;

	// @RequestMapping(value = "/register", method = RequestMethod.POST)
	// public ModelAndView student() {
	// return new ModelAndView("register", "user", new User());
	// }

	@RequestMapping(value = "/register/newUser", method = RequestMethod.POST)
	public String addUser(@Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "redirect:/register";
		}
		Role role = new Role();
		role.setId(2);
		role.setRole("user");
		user.setRole(role);
		userService.addUser(user);
		return "user";
	}

	@RequestMapping(value = "/manageFlight/newFlight", method = RequestMethod.POST)
	public String addFlight(@Valid Flight flight, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "redirect:/manageFlight";
		}
		flightService.addFlight(flight);
		model.addAttribute("userList", userService.allUser());
		model.addAttribute("flightList", flightService.allFlight());
		return "admin";
	}
}
