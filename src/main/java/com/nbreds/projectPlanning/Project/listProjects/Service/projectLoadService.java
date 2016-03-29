package com.nbreds.projectPlanning.Project.listProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.listProjects.Dao.ProjectLoadDAO;

@Service
public class projectLoadService {
	@Autowired
	ProjectLoadDAO projectLoadDao;

	public int getTotalProjectNo() {
		int totalProjectNo = 0;
		totalProjectNo = projectLoadDao.count();
		
		return totalProjectNo;	
	}

	public List<Project> getPageList(HashMap<String, Integer> param) {
		return projectLoadDao.getPageList(param);
	}

	public Project getProjectByPno(int pno) {
		return projectLoadDao.getProjectByPno(pno);
	}

	public void removeProject(int pno) {
		projectLoadDao.removeProject(pno);
	}
	
	public CodeTable getCodeName(HashMap<String, String> param) {
		return projectLoadDao.getCodeName(param);
	}

	public void updateProject(Project project) {
		projectLoadDao.updateProject(project);
	}
	
	public User getUserForNo(int uno) {
		return projectLoadDao.getUserForNo(uno);
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return projectLoadDao.getCodeTable(CODE_TYPE);
	}
	
	public List<User> getUsersForName(String uname) {
		return projectLoadDao.getUsersForName(uname);
	}
}
