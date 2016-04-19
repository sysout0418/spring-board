package com.nbreds.projectPlanning.admin.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("AdminDao")
public class AdminDao {
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Project> get5Projects() {
		return sqlSession.selectList("get5Projects");
	}

	public List<User> get5Users() {
		return sqlSession.selectList("get5Users");
	}

	public int getCountUsers() {
		return sqlSession.selectOne("getCountUsers");
	}

	public int getCountProjects() {
		return sqlSession.selectOne("getCountProjects");
	}

	public List<Project> getAllProjects() {
		return sqlSession.selectList("getAllProjects");
	}
	
	public List<User> selectAllUser() {
		return sqlSession.selectList("admin.selectAllUser");
	}

	public List<CodeTable> getDepartmentList(String codeType) {
		return sqlSession.selectList("admin.getDepartmentList", codeType);
	}
	
}