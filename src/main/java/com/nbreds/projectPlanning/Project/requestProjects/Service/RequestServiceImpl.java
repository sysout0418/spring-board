package com.nbreds.projectPlanning.Project.requestProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.requestProjects.Dao.RequestDao;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service("RequestService")
public class RequestServiceImpl implements RequestService {
	static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);
	
	@Autowired
	RequestDao requestDao;

	@Override
	public void updateStat(HashMap<String, Object> param) {
		requestDao.updateStat(param);
	}

	@Override
	public int getCountRequestProjects(String uno) {
		return requestDao.getCountRequestProjects(uno);
	}

	@Override
	public List<HashMap<String, Object>> getRequestProjects(HashMap<String, Object> param) {
		requestDao.setRownum();
		return requestDao.getRequestProjects(param);
	}

	@Override
	public List<HashMap<String, Object>> getMessagesByUno(String uno) {
		return requestDao.getMessagesByUno(uno);
	}

	@Override
	public List<HashMap<String, Object>> getProjectByUno(String uno) {
		requestDao.setRownum();
		
		return requestDao.getProjectByUno(uno);
	}

	@Override
	public int getCountAllMilestone(int pno) {
		return requestDao.getCountAllMilestone(pno);
	}

	@Override
	public double getCountClosedMilestone(int pno) {
		return requestDao.getCountClosedMilestone(pno);
	}
}