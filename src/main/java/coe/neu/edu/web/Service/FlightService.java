package coe.neu.edu.web.Service;

import java.util.List;

import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Ticket;

public interface FlightService {
	
	List<Flight> allFlight();
	
	void deleteFlight(int flight_id);
	
	void addFlight(Flight flight);
	
	void updateFlight(int Flight_id, Ticket ticket);
	
	Flight searchFlighById(int flight_id);

	List<Flight> searchFlightByCity(String start_city, String destination);
}
