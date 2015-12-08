package coe.neu.edu.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import coe.neu.edu.web.Service.FlightService;
import coe.neu.edu.web.model.ChosenFlights;
import coe.neu.edu.web.model.Flight;

@Controller
@RequestMapping
public class FlightController {

	@Autowired
	FlightService flightService;

	@RequestMapping(value = "bookTrip/all", method = RequestMethod.GET)
	public String getSearchedFlights(String start_city, String destination,
			String arrive_time, Model model, ModelMap map) {
		// String start_city = flight.getStart_city();
		// String destination = flight.getDestination();
		// String arrive_time = flight.getArrive_time();
		System.out.println(arrive_time);
		List<Flight> flights = flightService.searchFlightByCity(start_city,
				destination);
		List<Flight> returnFlights = flightService.searchFlightByCity(
				destination, start_city);
		if ("" == arrive_time) {
			model.addAttribute("flights", flights);
			model.addAttribute("chosenflights", new ChosenFlights());

		} else {
			model.addAttribute("flights", flights);
			model.addAttribute("returnFlights", returnFlights);
			model.addAttribute("chosenflights", new ChosenFlights());
		}
		if (flights.isEmpty()&&returnFlights.isEmpty()) {
			map.addAttribute("message", "No matched flights were found...");
			return "redirect:/bookTrip";
		}else{
			return "searchFlights";
		}
	}

	@RequestMapping(value = "admin/{flight_id}", method = RequestMethod.DELETE)
	public @ResponseBody String deleteFlight(@PathVariable int flight_id) {
		flightService.deleteFlight(flight_id);
		return "redirect:/admin";
	}
}
