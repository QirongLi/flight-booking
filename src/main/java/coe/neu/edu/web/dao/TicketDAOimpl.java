package coe.neu.edu.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coe.neu.edu.web.Service.UserService;
import coe.neu.edu.web.model.Flight;
import coe.neu.edu.web.model.Ticket;
import coe.neu.edu.web.model.User;

@Repository
public class TicketDAOimpl implements TicketDAO {
	@Autowired
	SessionFactory sessionFactory;

	UserService userService;

	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void createTicket(Ticket ticket) {

		sessionFactory.getCurrentSession().save(ticket);
		sessionFactory.getCurrentSession().flush();
		// sessionFactory.getCurrentSession().clear();
	}

	@Override
	public void retureTicket(int ticket_id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Ticket> ticketList = sessionFactory.getCurrentSession()
				.createQuery("from Ticket").list();
		for (Ticket t : ticketList) {
			if (t.getTicket_id() == ticket_id) {
				t.setPayment("Returned");
				sessionFactory.getCurrentSession().update(t);
				sessionFactory.getCurrentSession().flush();
			}
		}
	}

	@Override
	public List<Ticket> searchTicketByUser(int user_id) {
		// TODO Auto-generated method stub
		List<Ticket> tickets = new ArrayList<Ticket>();
		@SuppressWarnings("unchecked")
		List<Ticket> ticketList = sessionFactory.getCurrentSession()
				.createQuery("from Ticket").list();
		for (Ticket t : ticketList) {
			if (t.getUser().getUser_id() == user_id) {
				tickets.add(t);
			}
		}
		return tickets;
	}

	@Override
	public void updateTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Ticket> ticketList = sessionFactory.getCurrentSession()
				.createQuery("from Ticket").list();
		for (Ticket t : ticketList) {
			if (t.getTicket_id() == ticket.getTicket_id()) {
				t.setPayment("Paid");
				sessionFactory.getCurrentSession().update(t);
				sessionFactory.getCurrentSession().flush();
			}
		}
	}

	@Override
	public Ticket searchTicketById(int ticket_id) {
		@SuppressWarnings("unchecked")
		List<Ticket> ticketList = sessionFactory.getCurrentSession()
				.createQuery("from Ticket").list();
		for (Ticket t : ticketList) {
			if (t.getTicket_id() == ticket_id) {
				return t;
			}
		}
		return null;
	}

}
