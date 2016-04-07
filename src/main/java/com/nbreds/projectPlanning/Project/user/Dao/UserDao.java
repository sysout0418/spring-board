package com.nbreds.projectPlanning.Project.user.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.User;

@Repository("UserDao")
public class UserDao {
	private static final Logger logger = LoggerFactory.getLogger(UserDao.class);

	//@Autowired
	private SqlSessionTemplate sqlSession;

	public UserDao() {}
	
	public UserDao(SqlSessionTemplate sqlSession) {
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