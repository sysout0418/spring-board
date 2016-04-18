package com.nbreds.projectPlanning.Project.registProject.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface RegistService {
	public void savePrjAndPrjMS(Project project, ProjectMemberStat projectMS);
	
	public int getLastno();
	
	public List<CodeTable> getCodeTable(String CODE_TYPE);

	public List<User> getUsersForName(String uname);

	public User getUserForNo(int uno);
}
