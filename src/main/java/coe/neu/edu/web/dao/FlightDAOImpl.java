package coe.neu.edu.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Ticket;

@Repository
public class FlightDAOImpl implements FlightDAO {

	@Autowired
	SessionFactory sessionFactory;

	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addFlight(Flight flight) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(flight);
	}

	@Override
	public Flight find(int flight_id) {
		// TODO Auto-generated method stub
	
		@SuppressWarnings("unchecked")
		List<Flight> flightList = sessionFactory.getCurrentSession()
				.createQuery("from Flight").list();
		for (Flight f : flightList) {
			if (f.getFlight_id() == flight_id) {
				return f;
			}
		}

		return null;
	}

	@Override
	public void update(int flight_id,Ticket ticket) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Flight> flightList = sessionFactory.getCurrentSession()
				.createQuery("from Flight").list();
		for (Flight f : flightList) {
			if (f.getFlight_id() == flight_id) {
				f.getTicketHistory().add(ticket);
				sessionFactory.getCurrentSession().saveOrUpdate(f);
				sessionFactory.getCurrentSession().flush();
			}
		}
	}

	@Override
	public void delete(int flight_id) {
		Flight flight = (Flight) sessionFactory.getCurrentSession().get(
				Flight.class, flight_id);
		if (null != flight) {
			try {
				sessionFactory.getCurrentSession().delete(flight);
				sessionFactory.getCurrentSession().flush();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Flight> getSearchFlightList(String start_city,
			String destination) {

		List<Flight> flights = new ArrayList<Flight>();
		@SuppressWarnings("unchecked")
		List<Flight> flightList = sessionFactory.getCurrentSession()
				.createQuery("from Flight").list();
		for (Flight f : flightList) {
			if (f.getStart_city().equalsIgnoreCase(start_city)
					&& f.getDestination().equalsIgnoreCase(destination)) {
				flights.add(f);
			}
		}
		return flights;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Flight> all() {
		return sessionFactory.getCurrentSession().createQuery("from Flight")
				.list();
	}

}
