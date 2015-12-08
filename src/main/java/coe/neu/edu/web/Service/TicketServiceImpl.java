package coe.neu.edu.web.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coe.neu.edu.web.dao.TicketDAO;
import coe.neu.edu.web.model.Ticket;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketDAO ticketDAO;

	@Override
	public void createTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		ticketDAO.createTicket(ticket);
	}

	@Override
	public void returnTicket(int ticket_id) {
		// TODO Auto-generated method stub
		ticketDAO.retureTicket(ticket_id);
	}

	@Override
	public List<Ticket> searchTicketByUser(int user_id) {
		// TODO Auto-generated method stub
		return ticketDAO.searchTicketByUser(user_id);
	}

	@Override
	public void updateTicket(Ticket ticket) {
		// TODO Auto-generated method stub
	ticketDAO.updateTicket(ticket);	
	}

	@Override
	public Ticket searchTicketById(int ticket_id) {
		// TODO Auto-generated method stub
		return ticketDAO.searchTicketById(ticket_id);
	}

}
