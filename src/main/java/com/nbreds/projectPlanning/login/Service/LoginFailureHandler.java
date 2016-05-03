package com.nbreds.projectPlanning.login.Service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginFailureHandler.class);
			
	private LoginService userService;
	
	public LoginFailureHandler(LoginService userService) {
		this.userService = userService;
	}
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		Map<String, Object> userInfo = userService.getUserInfo();
		if (userInfo != null) {
			logger.info("아이디는 존재하는 경우");
			response.sendRedirect("/loginForm?error");
		} else {
			logger.info("아이디도 존재하지 않는 경우");
			response.sendRedirect("/loginForm?error2");
		}
	}

}
