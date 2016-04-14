package com.nbreds.projectPlanning.Project.myProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface MyProjectService {
	static final Logger logger = LoggerFactory.getLogger(MyProjectService.class);
	
	public List<Project> getProjectByUno(String uno);
	
	public User getUserForNo(int uno);
	
	public Project getProjectByPno(int pno);
	
	public CodeTable getCodeName(HashMap<String, String> param);

	int getCountRequestProjects(String uno);

	public List<Project> searchProject(HashMap<String, Object> param);
}