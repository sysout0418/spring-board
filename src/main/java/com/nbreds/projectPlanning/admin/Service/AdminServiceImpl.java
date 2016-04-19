package com.nbreds.projectPlanning.admin.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.admin.Dao.AdminDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
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
	
	@Override
	public List<User> selectAllUser(Map<String, Object> param) {
		return adminDao.selectAllUser(param);
	}

	@Override
	public int totalUserCount(Map<String, Object> param) {
		return adminDao.totalUserCount(param);
	}
	
	@Override
	public List<CodeTable> getDepartmentList(String codeType) {
		return adminDao.getDepartmentList(codeType);
	}



}