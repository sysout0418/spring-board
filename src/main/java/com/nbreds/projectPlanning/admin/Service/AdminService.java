package com.nbreds.projectPlanning.admin.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface AdminService {
	static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	List<Project> get5Projects();

	List<User> get5Users();

	int getCountUsers();

	int getCountProjects();

	List<Project> getAllProjects();

	void removeProjects(int i);
}
