package com.nbreds.projectPlanning.Project.requestProjects.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;

@Repository("RequestDao")
public class RequestDao {
	private static final Logger logger = LoggerFactory.getLogger(RequestDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Project> getRequestProjects(String uno) {
		return sqlSession.selectList("project.getRequestProjects", uno);
	}
	public void updateStat(HashMap<String, Object> param) {
		sqlSession.update("project.updateStat", param);
	}
	public int getCountRequestProjects(String uno) {
		return sqlSession.selectOne("project.getCountRequestProjects", uno);
	}
}