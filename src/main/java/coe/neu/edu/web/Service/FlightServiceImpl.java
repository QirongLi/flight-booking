package coe.neu.edu.web.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coe.neu.edu.web.dao.FlightDAO;
import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Ticket;

@Service
@Transactional
public class FlightServiceImpl implements FlightService {

	@Autowired
	private FlightDAO flightDAO;

	@Override
	public List<Flight> allFlight() {
		// TODO Auto-generated method stub
		return flightDAO.all();
	}

	@Override
	public void addFlight(Flight flight) {
		// TODO Auto-generated method stub
		flightDAO.addFlight(flight);
	}

	@Override
	public Flight searchFlighById(int flight_id) {
		// TODO Auto-generated method stub
		return flightDAO.find(flight_id);
		}

	@Override
	public List<Flight> searchFlightByCity(String start_city, String destination) {
		// TODO Auto-generated method stub
		return flightDAO.getSearchFlightList(start_city, destination);
	}

	@Override
	public void deleteFlight(int flight_id) {
		// TODO Auto-generated method stub
		flightDAO.delete(flight_id);
	}

	@Override
	public void updateFlight(int flight_id, Ticket ticket) {
		// TODO Auto-generated method stub
		flightDAO.update(flight_id,ticket);
	}

}
