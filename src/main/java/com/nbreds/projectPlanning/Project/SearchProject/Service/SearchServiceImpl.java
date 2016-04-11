package com.nbreds.projectPlanning.Project.SearchProject.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.SearchProject.Dao.SearchDao;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service("SearchService")
public class SearchServiceImpl implements SearchService{
	
	public static final Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Autowired
	SearchDao searchDao;
	
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
	
	@Override
	public List<Project> allProjectList(Map<String, Object> param) {
		return searchDao.allProjectList(param);
	}
	
	@Override
	public int totalCount(Map<String, Object> param) {
		return searchDao.totalCount(param);
	}
}
