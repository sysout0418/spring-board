package com.nbreds.projectPlanning.Project.listProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.Project.listProjects.Dao.ListDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service("ListService")
public class ListServiceImpl implements ListService {
	static final Logger logger = LoggerFactory.getLogger(ListServiceImpl.class);
	
	@Autowired
	ListDao listDao;

	public int getTotalProjectNo() {
		int totalProjectNo = 0;
		totalProjectNo = listDao.count();
		
		return totalProjectNo;	
	}

	public List<Project> getPageList(HashMap<String, Integer> param) {
		return listDao.getPageList(param);
	}

	public Project getProjectByPno(int pno) {
		return listDao.getProjectByPno(pno);
	}

	public void removeProject(int pno) {
		listDao.removeProject(pno);
	}

	public void updateProject(Project project, String requestedUserNoList) {
		listDao.updateProject(project);
	}
	
	public User getUserForNo(int uno) {
		return listDao.getUserForNo(uno);
	}
	
	@Override
	public int getParticipateUserCnt(int pno) {
		return listDao.getParticipateUserCnt(pno);
	}
	
	@Override
	public List<ProjectMemberStat> getParticipateUserList(int pno) {
		return listDao.getParticipateUserList(pno);
	}
	
	@Override
	public List<User> getAllUser() {
		return listDao.getAllUser();
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return listDao.getCodeTable(CODE_TYPE);
	}
	
	public List<User> getUsersForName(String uname) {
		return listDao.getUsersForName(uname);
	}



}