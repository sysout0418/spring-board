package com.nbreds.projectPlanning.admin.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.admin.Dao.AdminDao;
import com.nbreds.projectPlanning.common.VO.User;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDao adminDao;

	@Override
	public List<Project> get5Projects() {
		return adminDao.get5Projects();
	}

	@Override
	public List<User> get5Users() {
		return adminDao.get5Users();
	}

	@Override
	public int getCountUsers() {
		return adminDao.getCountUsers();
	}

	@Override
	public int getCountProjects() {
		return adminDao.getCountProjects();
	}

	@Override
	public List<Project> getAllProjects() {
		return adminDao.getAllProjects();
	}
}