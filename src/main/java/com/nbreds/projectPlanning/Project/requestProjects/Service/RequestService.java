package com.nbreds.projectPlanning.Project.requestProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;

@Service
public interface RequestService {
	static final Logger logger = LoggerFactory.getLogger(RequestService.class);
	
	public List<Project> getRequestProjects(String uno);

	public void updateStat(HashMap<String, Object> param);
}
