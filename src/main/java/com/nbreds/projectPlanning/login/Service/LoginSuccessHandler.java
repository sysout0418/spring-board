package com.nbreds.projectPlanning.login.Service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private LoginService userService;
	
	public LoginSuccessHandler(LoginService userService) {
		this.userService = userService;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req,
			HttpServletResponse res, Authentication auth) throws IOException,
			ServletException {
		
		Map<String, Object> userInfo = userService.getUserInfo();
		if (userInfo != null) {
			String uno = userInfo.get("uno").toString();
			String theFirstLetterOfEmail = userInfo.get("username").toString().substring(0, 1).toUpperCase();
			String profileBgColor = userInfo.get("bgColor").toString();
			HttpSession session = req.getSession();
			session.setAttribute("user_no", Integer.parseInt(uno));
			session.setAttribute("theFirstLetterOfEmail", theFirstLetterOfEmail);
			session.setAttribute("profileBgColor", profileBgColor);
			logger.info("uno : " + uno);
			logger.info("theFirstLetterOfEmail : " + theFirstLetterOfEmail);
			logger.info("profileBgColor : " + profileBgColor);
		}
		logger.info(req.getParameter("uemail"));
		logger.info(req.getParameter("upassword"));
		logger.info(auth.getName());
		logger.info(auth.getAuthorities().toString());
		logger.info(auth.getDetails().toString());
		logger.info(auth.getPrincipal().toString());
		for(GrantedAuthority a : auth.getAuthorities()){
			logger.info(a.getAuthority());
		}
		
		res.sendRedirect("/");
	}

}