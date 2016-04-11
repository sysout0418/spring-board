package com.nbreds.projectPlanning.login.Service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.util.User;


@Service
public interface LoginService extends UserDetailsService {
	static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	void saveUser(User user);
	
	User loginUserByIdPw(User user);
	
	User checkUserById(String uemail);
	
	Map<String, Object> getUserInfo();
}
