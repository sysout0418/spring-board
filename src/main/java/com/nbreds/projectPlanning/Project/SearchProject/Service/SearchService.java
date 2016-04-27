package com.nbreds.projectPlanning.Project.SearchProject.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface SearchService {
	static final Logger logger = LoggerFactory.getLogger(SearchService.class);
	
	public List<CodeTable> getCodeTable(String CODE_TYPE);
	
	public List<Project> getPageList(HashMap<String, Object> param);
	
	public int getTotalProjectNo();
	
	public User getUserForNo(int uno);
	
	/** 페이징 처리를 위한 allProjectList */
	List<Project> allProjectList(Map<String, Object> param);
	
	/** 페이징 처리를 위한 totalCount */
	public int totalCount(Map<String, Object> param);
	
	int getCountAllMilestone(int pno);
	
	double getCountClosedMilestone(int pno);
}
