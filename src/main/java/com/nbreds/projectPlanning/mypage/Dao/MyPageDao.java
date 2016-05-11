package com.nbreds.projectPlanning.mypage.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("MyPageDao")
public class MyPageDao {
	private static final Logger logger = LoggerFactory.getLogger(MyPageDao.class);

	@Autowired
	private SqlSession sqlSession;

	public HashMap<String, String> getUserInfoByUno(int uno) {
		return sqlSession.selectOne("mypage.getUserInfoByUno", uno);
	}

	public List<CodeTable> getAllDepartmentList() {
		return sqlSession.selectList("mypage.getAllDepartmentList");
	}
}