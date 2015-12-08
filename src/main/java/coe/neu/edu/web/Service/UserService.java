package coe.neu.edu.web.Service;

import java.util.List;

import coe.neu.edu.web.model.User;

public interface UserService {
	User getUser(String username);
void deleteUser(int user_id);
	public void addUser(User user);
	List<User> allUser();
}
