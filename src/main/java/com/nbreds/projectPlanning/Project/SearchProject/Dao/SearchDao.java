package com.nbreds.projectPlanning.Project.SearchProject.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.selectList("project.search.getCodeTable", CODE_TYPE);
	}
	public List<Project> getPageList(HashMap<String, Object> param) {
		return sqlSession.selectList("project.search.getPageList", param);
	}
	public int count(){
		int count = 0;
		count = sqlSession.selectOne("project.search.getTotalProjectNo");
		
		return count;
	}
	
	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.search.getUserForNo", uno);
	}
	
	// 페이징 처리를 위한 allProjectList
	public List<Project> allProjectList(Map<String, Object> param) {
		return sqlSession.selectList("project.search.allProjectList", param);
	}
	
	// 페이징 처리를 위한 totalCount
	public int totalCount(Map<String, Object> param) {
		return sqlSession.selectOne("project.search.totalCount", param);
	}
	
	// pno로 모든 마일스톤 갯수 구해오기
	public int getCountAllMilestone(int pno) {
		return sqlSession.selectOne("project.search.getCountAllMilestone", pno);
	}
	
	// pno로 closed 된 마일스톤 갯수 구해오기
	public double getCountClosedMilestone(int pno) {
		return sqlSession.selectOne("project.search.getCountClosedMilestone", pno);
	}
	
}