package com.nbreds.projectPlanning.Project.user.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.user.Dao.UserDao;


@Service("UserService")
public class UserServiceImpl implements UserService {
	public static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	UserDao userDao;
	
	Map<String, Object> userInfo;
	
	public UserServiceImpl() {}
	
	public UserServiceImpl(SqlSessionTemplate sqlSession) {
		userDao = new UserDao(sqlSession);
	}
	
	@Override
	public void saveUser(User user) {
		userDao.saveUser(user);
	}

	@Override
	public User loginUserByIdPw(User user) {
		User userInfo = userDao.loginUserByIdPw(user);
		if (userInfo != null) {
			return userInfo;
		}
		return null;
	}
	
	@Override
	public User checkUserById(String uemail) {
		User userInfo = userDao.checkUserById(uemail);
		if (userInfo != null) {
			return userInfo;
		}
		return null;
	}

	/** 사용자 권한 설정 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		userInfo = userDao.loadUserByUsername(username);
		if (userInfo == null)
			throw new UsernameNotFoundException(username);
		logger.info(userInfo.toString());
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(userInfo.get("authority").toString()));
//		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
//		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
//		UserDetails sUser = 
//				new org.springframework.security.core.userdetails.User(
//						username, 
//						user.get("password").toString(), 
//						roles);
		UserDetails sUser = 
				new org.springframework.security.core.userdetails.User(
						username,
						userInfo.get("password").toString(),
						(Integer) userInfo.get("enabled") == 1,
						true,
						true,
						true,
						gas);
		return sUser;
	}

	@Override
	public Map<String, Object> getUserInfo() {
		if (userInfo != null) {
			return userInfo;
		}
		return null;
	}
	
	
}
