package coe.neu.edu.web.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ticket")
public class Ticket implements Serializable{

	// private static int i=20000;
	//
	// public Ticket() {
	// i++;
	// ticket_id=i;
	// }

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int ticket_id;

	@ManyToOne
	@JoinColumn(name = "user_ID", nullable = true)
	private User user;

	@ManyToOne
	@JoinColumn(name = "flight_ID", nullable = true)
	private Flight flight;

	@Column(name = "price")
	@NotNull
	private float price;

	@Column(name = "Payment")
	@NotNull
	private String payment;

	public void setPrice(float price) {
		this.price = price;
	}

	public float getPrice() {
		return price;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getPayment() {
		return payment;
	}

}
