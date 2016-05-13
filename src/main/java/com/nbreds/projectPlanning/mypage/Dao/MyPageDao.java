package com.nbreds.projectPlanning.mypage.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.CodeTable;

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

	public void editProfile(HashMap<String, Object> param) {
		sqlSession.update("mypage.editProfile", param);
	}

	public List<HashMap<String, Object>> getDatasByUno(HashMap<String, String> param) {
		return sqlSession.selectList("mypage.getDatasByUno");
	}
}