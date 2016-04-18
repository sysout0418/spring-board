package com.nbreds.projectPlanning.Project.common.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("CommonDao")
public class CommonDao {
	private static final Logger logger = LoggerFactory.getLogger(CommonDao.class);	

	@Autowired
	private SqlSession sqlSession;
	
	// 03-22 추가
	// 모든 유저의 이름과 유저 번호 가져옴
	public List<User> getAllUserNameAndNo() {
		return sqlSession.selectList("project.common.getAllUserNameAndNo");
	}
	
	public CodeTable getCodeName(HashMap<String, String> param) {
		return sqlSession.selectOne("project.common.getCodeName", param);
	}
}