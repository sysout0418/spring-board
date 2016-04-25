package com.nbreds.projectPlanning.Project.myProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.myProjects.Dao.MyProjectDao;
import com.nbreds.projectPlanning.common.VO.User;

@Service("MyProjectService")
public class MyProjectServiceImpl implements MyProjectService {
	static final Logger logger = LoggerFactory.getLogger(MyProjectServiceImpl.class);
	
	@Autowired
	MyProjectDao myProjectsDao;
	
	public List<HashMap<String, Object>> getProjectByUno(String uno) {
		myProjectsDao.setRownum();
		return myProjectsDao.getProjectByUno(uno);
	}
	public User getUserForNo(int uno) {
		return myProjectsDao.getUserForNo(uno);
	}
	public HashMap<String, Object> getProjectByPno(int pno) {
		return myProjectsDao.getProjectByPno(pno);
	}
	@Override
	public List<Project> searchProject(HashMap<String, Object> param) {
		return myProjectsDao.searchProject(param);
	}
	@Override
	public List<HashMap<String, Object>> getRequestMember(int pno) {
		return myProjectsDao.getRequestMember(pno);
	}
	@Override
	public int getParticipateUserCnt(int pno) {
		return myProjectsDao.getParticipateUserCnt(pno);
	}
	@Override
	public int getCountAllMilestone(int pno) {
		return myProjectsDao.getCountAllMilestone(pno);
	}
	@Override
	public double getCountClosedMilestone(int pno) {
		return myProjectsDao.getCountClosedMilestone(pno);
	}
}