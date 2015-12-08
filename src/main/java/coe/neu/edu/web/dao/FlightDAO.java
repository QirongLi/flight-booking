package coe.neu.edu.web.dao;

import java.util.List;

import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Ticket;

public interface FlightDAO {
	void addFlight(Flight flight);

	Flight find(int flight_id);

	void update(int flight_id, Ticket ticket);

	void delete(int flight_id);

	List<Flight> all();

	List<Flight> getSearchFlightList(String start_city, String destination);

}
