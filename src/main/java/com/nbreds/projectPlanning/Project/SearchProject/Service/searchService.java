package com.nbreds.projectPlanning.Project.SearchProject.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.SearchProject.Dao.SearchDAO;
import com.nbreds.projectPlanning.Project.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.User;

@Service
public class searchService {
	@Autowired
	SearchDAO searchDao;
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return searchDao.getCodeTable(CODE_TYPE);
	}
	public List<Project> getPageList(HashMap<String, Object> param) {
		return searchDao.getPageList(param);
	}
	public int getTotalProjectNo() {
		int totalProjectNo = 0;
		totalProjectNo = searchDao.count();
		
		return totalProjectNo;	
	}
	public CodeTable getCodeName(HashMap<String, String> param) {
		return searchDao.getCodeName(param);
	}
	public User getUserForNo(int uno) {
		return searchDao.getUserForNo(uno);
	}
}
