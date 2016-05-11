package com.nbreds.projectPlanning.common.mail.Dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("EmailDao")
public class EmailDao {
	private static final Logger logger = LoggerFactory.getLogger(EmailDao.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int editPassword(HashMap<String, String> param) {
		return sqlSession.update("login.editPassword", param);
	}
}