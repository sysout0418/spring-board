package com.nbreds.projectPlanning.admin.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("AdminDao")
public class AdminDao {
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);	
	
	@Autowired
	private SqlSession sqlSession;

	public List<Project> get5Projects() {
		return sqlSession.selectList("admin.get5Projects");
	}

	public List<User> get5Users() {
		return sqlSession.selectList("admin.get5Users");
	}

	public int getCountUsers() {
		return sqlSession.selectOne("admin.getCountUsers");
	}

	public int getCountProjects() {
		return sqlSession.selectOne("admin.getCountProjects");
	}

	public List<Project> getAllProjects() {
		return sqlSession.selectList("admin.getAllProjects");
	}

	public void removeProjects(int i) {
		sqlSession.delete("admin.removeProjects", i);
	}
}