package com.nbreds.projectPlanning.Project.myProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface MyProjectService {
	static final Logger logger = LoggerFactory.getLogger(MyProjectService.class);
	
	public List<HashMap<String, Object>> getProjectByUno(String uno);
	
	public User getUserForNo(int uno);
	
	public HashMap<String, Object> getProjectByPno(int pno);

	public List<Project> searchProject(HashMap<String, Object> param);

	public List<HashMap<String, Object>> getRequestMember(int pno);
	
	int getParticipateUserCnt(int pno);

	public int getCountAllMilestone(int pno);

	public double getCountClosedMilestone(int pno);

	public int getcountAllIssue(int pno);

	public List<HashMap<String, Object>> getActivityByPno(int pno);
}