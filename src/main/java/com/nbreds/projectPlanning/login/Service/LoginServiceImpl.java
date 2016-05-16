package com.nbreds.projectPlanning.login.Service;

import java.util.ArrayList;
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
import org.springframework.transaction.annotation.Transactional;

import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.login.Dao.LoginDao;


@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	public static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Autowired
	LoginDao loginDao;
	
	Map<String, Object> userInfo;
	
	public LoginServiceImpl() {}
	
	public LoginServiceImpl(SqlSessionTemplate sqlSession) {
		loginDao = new LoginDao(sqlSession);
	}
	
	@Override
	public void saveUser(User user) {
		loginDao.saveUser(user);
		loginDao.saveAuthority(user.getUno());
	}

	@Override
	public User loginUserByIdPw(User user) {
		User userInfo = loginDao.loginUserByIdPw(user);
		if (userInfo != null) {
			return userInfo;
		}
		return null;
	}
	
	@Override
	public User checkUserById(String uemail) {
		User userInfo = loginDao.checkUserById(uemail);
		if (userInfo != null) {
			return userInfo;
		}
		return null;
	}

	/** 사용자 권한 설정 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		userInfo = loginDao.loadUserByUsername(username);
		if (userInfo == null)
			throw new UsernameNotFoundException(username);
		logger.info(userInfo.toString());
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(userInfo.get("authority").toString()));
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

	@Override
	public Map<String, Object> getUserInfoByEmail(String uemail) {
		return loginDao.getUserInfoByEmail(uemail);
	}
}