package com.nbreds.projectPlanning.Project.myProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.myProjects.Dao.myProjectsDAO;

@Service
public class myProjectsService {
	@Autowired
	myProjectsDAO  myProjectsDao;

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
