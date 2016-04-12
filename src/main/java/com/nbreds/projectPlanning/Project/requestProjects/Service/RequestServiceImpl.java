package com.nbreds.projectPlanning.Project.requestProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.requestProjects.Dao.RequestDao;

@Service("RequestService")
public class RequestServiceImpl implements RequestService {
	static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);
	
	@Autowired
	RequestDao requestDao;
	
	@Override
	public List<Project> getRequestProjects(String uno) {
		return requestDao.getRequestProjects(uno);
	}

	@Override
	public void updateStat(HashMap<String, Object> param) {
		requestDao.updateStat(param);
	}
}