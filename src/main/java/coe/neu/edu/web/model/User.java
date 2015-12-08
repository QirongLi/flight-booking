package coe.neu.edu.web.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="user")
public class User {

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int user_id;

	@Column(name = "username")
	@NotEmpty
	@Size(min = 1, max = 30)
	private String username;

	@Column(name = "password")
	@NotEmpty
	@Size(min = 1, max = 255)
	private String password;

	@Column(name = "firstname")
	@NotEmpty
	@Size(min = 1, max = 30)
	private String firstname;

	@Column(name = "lastname")
	@NotEmpty
	@Size(min = 1, max = 30)
	private String lastname;

	@Column(name = "email")
	@NotEmpty
	@Size(min = 1, max = 60)
	private String email;

	@Column(name = "phone")
	@NotEmpty
	@Size(min = 1, max = 30)
	private String phone;

	@Column(name = "address")
	private String address;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinTable(name = "user_roles", joinColumns = { @JoinColumn(name = "user_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "role_id", referencedColumnName = "id") })
	private Role role;

	@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="user")
	private Set<Ticket> ticketHistory = new HashSet<Ticket>();
	
	@JsonIgnore
	public Set<Ticket> getTicketHistory() {
		return ticketHistory;
	}

	public void setTicketHistory(Set<Ticket> ticketHistory) {
		this.ticketHistory = ticketHistory;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username
				+ ", password=" + password + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", email=" + email + ", phone="
				+ phone + ", address=" + address + ", role=" + role + "]";
	}

	

}
