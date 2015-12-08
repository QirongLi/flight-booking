package coe.neu.edu.web.dao;

import java.util.List;

import coe.neu.edu.web.model.Ticket;

public interface TicketDAO {
	
	void createTicket(Ticket ticket);
	
	void updateTicket(Ticket ticket);
	
	void retureTicket(int ticket_id);
	
	List<Ticket> searchTicketByUser(int user_id);
	
	Ticket searchTicketById(int ticket_id);
}
