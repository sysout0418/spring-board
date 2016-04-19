package com.nbreds.projectPlanning.admin.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("AdminDao")
public class AdminDao {
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public int countAllUser() {
		return sqlSession.selectOne("admin.countAllUser");
	}
	
	public List<User> selectNewUser() {
		return sqlSession.selectList("admin.selectNewUser");
	}
	
	public List<User> selectAllUser() {
		return sqlSession.selectList("admin.selectAllUser");
	}

	public List<CodeTable> getDepartmentList(String codeType) {
		return sqlSession.selectList("admin.getDepartmentList", codeType);
	}
	
}