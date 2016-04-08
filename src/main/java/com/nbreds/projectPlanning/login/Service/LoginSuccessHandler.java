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
//		UserServiceImpl u = (UserServiceImpl) auth.getPrincipal();
		Map<String, Object> userInfo = userService.getUserInfo();
		if (userInfo != null) {
			String uno = userInfo.get("uno").toString();
			HttpSession session = req.getSession();
			session.setAttribute("user_no", Integer.parseInt(uno));
			logger.info(Integer.parseInt(uno) + "");
			
			// 아이디 저장 관련 쿠키 설정
			String uemail = req.getParameter("uemail");
			String rememberId = req.getParameter("rememberId");
			Cookie cookie = new Cookie("rememberId", uemail);
			if (rememberId != null && rememberId.equals("t")) {
				cookie.setMaxAge(2000000000);
			} else {
				cookie.setMaxAge(0);
			}
			res.addCookie(cookie);
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
//		logger.info(String.valueOf(u.isAccountNonExpired()));
//		logger.info(String.valueOf(u.isAccountNonLocked()));
//		logger.info(String.valueOf(u.isCredentialsNonExpired()));
//		logger.info(String.valueOf(u.isEnabled()));
		
		res.sendRedirect("/");
	}

}
