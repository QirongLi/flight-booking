package coe.neu.edu.web.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coe.neu.edu.web.dao.UserDAO;
import coe.neu.edu.web.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public List<User> allUser() {
		// TODO Auto-generated method stub
		return userDAO.all();
	}

	@Override
	@Transactional
	public User getUser(String username) {
		// TODO Auto-generated method stub
		return userDAO.getUser(username);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDAO.create(user);
	}

	@Override
	public void deleteUser(int user_id) {
		// TODO Auto-generated method stub
		userDAO.delete(user_id);
	}

}
