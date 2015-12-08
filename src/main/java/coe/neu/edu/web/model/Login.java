package coe.neu.edu.web.model;

import java.util.Map;

public class Login {
//	private String username;
//	private String password;
	private Map<String, String> login;

//	public void setUsername(String username) {
//		this.username = username;
//	}
//
//	public String getUsername() {
//		return username;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}
//
//	public String getPassword() {
//		return password;
//	}

	public void setLogin(Map<String, String> login) {
		this.login = login;
	}

	public Map<String, String> getLogin() {
		return login;
	}
}
