package coe.neu.edu.web.Service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coe.neu.edu.web.dao.RoleDAO;
import coe.neu.edu.web.model.Role;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO roleDAO;

	@Override
	public Role getRole(int id) {
		return roleDAO.getRole(id);
	}

}
