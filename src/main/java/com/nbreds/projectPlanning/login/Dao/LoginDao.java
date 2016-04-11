package com.nbreds.projectPlanning.login.Dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.User;

@Repository("LoginDao")
public class LoginDao {
	private static final Logger logger = LoggerFactory.getLogger(LoginDao.class);

	//@Autowired
	private SqlSessionTemplate sqlSession;

	public LoginDao() {}
	
	public LoginDao(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void saveUser(User user) {
		sqlSession.insert("login.saveUser", user);
	}

	public User loginUserByIdPw(User user) {
		return sqlSession.selectOne("login.loginUserByIdPw", user);
	}

	public User checkUserById(String uemail) {
		return sqlSession.selectOne("login.checkUserById", uemail);
	}

	public Map<String, Object> loadUserByUsername(String uemail) {
		return sqlSession.selectOne("login.getUserAuthority", uemail);
	}
	
	public int getLastno(){
		return sqlSession.selectOne("login.getLastno");
	}
	
	public void saveAuthority(int uno){
		sqlSession.insert("login.saveAuthority", uno);
	}
}