package com.nbreds.projectPlanning.Project.requestProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service
public interface RequestService {
	static final Logger logger = LoggerFactory.getLogger(RequestService.class);
	
	public List<HashMap<String, Object>> getRequestProjects(HashMap<String, Object> param);

	public void updateStat(HashMap<String, Object> param);

	public int getCountRequestProjects(String uno);

	public List<HashMap<String, Object>> getMilestonesByUno(String uno);

	public List<HashMap<String, Object>> getMessagesByUno(String uno);

	public int countIssuesByMno(int mno);

	public double countClosedIssueByMno(int mno);

	public int getCountAllMilestone(int pno);

	public double getCountClosedMilestone(int pno);
}
