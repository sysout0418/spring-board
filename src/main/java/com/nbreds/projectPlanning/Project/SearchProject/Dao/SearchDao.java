package com.nbreds.projectPlanning.Project.SearchProject.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("SearchDao")
public class SearchDao {
	private static final Logger logger = LoggerFactory.getLogger(SearchDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return sqlSession.selectList("project.getCodeTable", CODE_TYPE);
	}
	public List<Project> getPageList(HashMap<String, Object> param) {
		return sqlSession.selectList("project.getPageList", param);
	}
	public int count(){
		int count = 0;
		count = sqlSession.selectOne("project.getTotalProjectNo");
		
		return count;
	}
	public CodeTable getCodeName(HashMap<String, String> param) {
		return sqlSession.selectOne("project.getCodeName", param);
	}
	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.getUserForNo", uno);
	}
}
