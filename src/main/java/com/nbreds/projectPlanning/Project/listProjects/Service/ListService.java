package com.nbreds.projectPlanning.Project.listProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface ListService {
	static final Logger logger = LoggerFactory.getLogger(ListService.class);
	
	public int getTotalProjectNo();

	public List<Project> getPageList(HashMap<String, Integer> param);

	public Project getProjectByPno(int pno);

	public void removeProject(int pno);

	public void updateProject(Project project, String requestedUserNoList);
	
	public User getUserForNo(int uno);
	
	int getParticipateUserCnt(int pno);
	
	List<ProjectMemberStat> getParticipateUserList(int pno);
	
	List<User> getAllUser();
	
	public List<CodeTable> getCodeTable(String CODE_TYPE);
	
	public List<User> getUsersForName(String uname);
}
