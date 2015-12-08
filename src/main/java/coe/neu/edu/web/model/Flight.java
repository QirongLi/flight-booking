package coe.neu.edu.web.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "flight")
public class Flight implements Serializable{
	@Id
	@GeneratedValue
	@Column(name = "flight_id")
	private int flight_id;

	@Column(name = "start_city")
	@NotEmpty
	@Size(min = 1, max = 255)
	private String start_city;

	@Column(name = "destination")
	@NotEmpty
	@Size(min = 1, max = 255)
	private String destination;

	@Column(name = "start_time")
	@NotEmpty
	@Size(min = 1, max = 255)
	private String start_time;

	@Column(name = "arrive_time")
	@NotEmpty
	@Size(min = 1, max = 255)
	private String arrive_time;

	@Column(name = "price")
	@NotNull
	private float price;

	@Column(name = "total_ticket", nullable = false)
	@NotNull
	private int total_ticket;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "flight")
	private Set<Ticket> tickets = new HashSet<Ticket>();

	@JsonIgnore
	public Set<Ticket> getTicketHistory() {
		return tickets;
	}

	public void setTicketHistory(Set<Ticket> ticketHistory) {
		this.tickets = ticketHistory;
	}

	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}

	public int getFlight_id() {
		return flight_id;
	}

	public String getStart_city() {
		return start_city;
	}

	public void setStart_city(String start_city) {
		this.start_city = start_city;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getArrive_time() {
		return arrive_time;
	}

	public void setArrive_time(String arrive_time) {
		this.arrive_time = arrive_time;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getTotal_ticket() {
		return total_ticket;
	}

	public void setTotal_ticket(int total_ticket) {
		this.total_ticket = total_ticket;
	}

}
