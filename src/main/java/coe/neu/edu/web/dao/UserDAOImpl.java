package coe.neu.edu.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coe.neu.edu.web.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void create(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public User find(int user_id) {
		// TODO Auto-generated method stub
		return (User) sessionFactory.getCurrentSession().load(User.class,
				user_id);
	}

	@Override
	public User updata(int user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int user_id) {
		User user = (User) sessionFactory.getCurrentSession().get(User.class,
				user_id);
		if (null != user) {
			try {
				sessionFactory.getCurrentSession().delete(user);
				sessionFactory.getCurrentSession().flush();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> all() {
		return sessionFactory.getCurrentSession().createQuery("from User")
				.list();
	}

	@Override
	public User getUser(String username) {
		List<User> userList = new ArrayList<User>();
		Query query = openSession().createQuery(
				"from User u where u.username = :username");
		query.setParameter("username", username);
		userList = query.list();
		if (userList.size() > 0)
			return userList.get(0);
		else
			return null;
	}

}
