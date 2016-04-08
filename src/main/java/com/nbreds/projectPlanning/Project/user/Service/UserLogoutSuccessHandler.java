package com.nbreds.projectPlanning.Project.user.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class UserLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(UserLogoutSuccessHandler.class);

	public void onLogoutSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth) throws IOException{
		logger.info("logoutsuccess");
		HttpSession session = req.getSession();
		session.removeAttribute("user_no");
		
		res.sendRedirect("/loginForm");
	}
}
