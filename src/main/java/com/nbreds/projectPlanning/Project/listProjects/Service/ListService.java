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
import com.nbreds.projectPlanning.issues.VO.Label;

@Service
public interface ListService {
	static final Logger logger = LoggerFactory.getLogger(ListService.class);
	
	public int getTotalProjectNo();

	public List<HashMap<String, Object>> getPageList(HashMap<String, Integer> param);

	public HashMap<String, Object> getProjectByPno(int pno);

	public void removeProject(int pno);

	public void updateProject(Project project, String requestUserNoList);
	
	public User getUserForNo(int uno);
	
	int getParticipateUserCnt(int pno);
	
	List<ProjectMemberStat> getParticipateUserListByPno(int pno);
	
	List<ProjectMemberStat> getParticipateUserListByUno(int uno);
	
	List<User> getAllUser();
	
	void deleteMSByUno(int uno);
	
	void deleteMSByPno(int pno);
	
	void saveProjectMS(ProjectMemberStat projectMS);
	
	public List<CodeTable> getCodeTable(String CODE_TYPE);
	
	public List<User> getUsersForName(String uname);

	public int getCountAllMilestone(int pno);

	public double getCountClosedMilestone(int pno);

	public List<HashMap<String, Object>> getRequestMember(int pno);

	public List<HashMap<String, Object>> getActivityByPno(int pno);

	public int getcountAllIssue(int pno);

	public Project getUpdateProjectByPno(int pno);
	
	List<Label> getAllLabel();
	
}
