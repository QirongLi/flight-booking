package coe.neu.edu.web.Service;

import java.util.List;

import coe.neu.edu.web.model.Ticket;

public interface TicketService {
	void createTicket(Ticket ticket);
	
	void updateTicket(Ticket ticket);

	void returnTicket(int ticket_id);
	
	List<Ticket> searchTicketByUser(int user_id);
	
	Ticket searchTicketById(int ticket_id);
}
