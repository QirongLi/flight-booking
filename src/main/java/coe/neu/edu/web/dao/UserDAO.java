package coe.neu.edu.web.dao;

import java.util.List;

import coe.neu.edu.web.model.User;

public interface UserDAO {
	void create(User user);

	User find(int user_id);

	User updata(int user_id);

	void delete(int user_id);
	
    User getUser(String username);

	List<User> all();
}
