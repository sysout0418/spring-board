package com.nbreds.projectPlanning.Project.myProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.myProjects.Dao.MyProjectDao;
import com.nbreds.projectPlanning.common.util.CodeTable;
import com.nbreds.projectPlanning.common.util.User;

@Service("MyProjectService")
public class MyProjectServiceImpl implements MyProjectService {
	static final Logger logger = LoggerFactory.getLogger(MyProjectServiceImpl.class);
	
	@Autowired
	MyProjectDao myProjectsDao;
	
	public List<Project> getProjectByUno(String uno) {
		return myProjectsDao.getProjectByUno(uno);
	}
	public User getUserForNo(int uno) {
		return myProjectsDao.getUserForNo(uno);
	}
	public Project getProjectByPno(int pno) {
		return myProjectsDao.getProjectByPno(pno);
	}
	public CodeTable getCodeName(HashMap<String, String> param) {
		return myProjectsDao.getCodeName(param);
	}
}
