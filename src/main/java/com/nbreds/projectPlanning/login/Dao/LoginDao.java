package com.nbreds.projectPlanning.login.Dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.User;

@Repository("UserDao")
public class LoginDao {
	private static final Logger logger = LoggerFactory.getLogger(LoginDao.class);

	//@Autowired
	private SqlSessionTemplate sqlSession;

	public LoginDao() {}
	
	public LoginDao(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void saveUser(User user) {
		sqlSession.insert("project.saveUser", user);
	}

	public User loginUserByIdPw(User user) {
		return sqlSession.selectOne("project.loginUserByIdPw", user);
	}

//	public User checkUserById(User user) {
//		return sqlSession.selectOne("project.checkUserById", user);
//	}

	public User checkUserById(String uemail) {
		return sqlSession.selectOne("project.checkUserById", uemail);
	}

	public Map<String, Object> loadUserByUsername(String uemail) {
		return sqlSession.selectOne("project.getUserAuthority", uemail);
	}
}