package com.nbreds.projectPlanning.login.Controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.login.Service.LoginService;
import com.nbreds.projectPlanning.login.Service.ShaEncoder;
import com.nbreds.projectPlanning.login.VO.FacebookUserProfileVO;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	LoginService loginService;
	
	@Autowired
	ShaEncoder encoder;

	@Autowired
	private FacebookConnectionFactory connectionFactory;

	@Autowired
	private OAuth2Parameters oAuth2Parameters;
	
	private String redirectUri = "http://localhost:8181/checkFacebookId";

	public String getAuthorizeUrl() {
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		String authorizeUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		logger.info("authorizeUrl : " + authorizeUrl);
		return authorizeUrl;
	}

	public FacebookUserProfileVO getFacebookUserInfo(String code) {
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();

		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			logger.info("accessToken is expired. refresh token = {}", accessToken);
		}

		Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
		Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
		UserOperations userOperations = facebook.userOperations();

		FacebookUserProfileVO facebookUserProfileVO = new FacebookUserProfileVO();
		facebookUserProfileVO.setToken(accessToken);
		facebookUserProfileVO.setEmail(userOperations.getUserProfile().getEmail());
		facebookUserProfileVO.setName(userOperations.getUserProfile().getName());
		logger.info("facebookUserProfileVO : " + facebookUserProfileVO.toString());
		
		return facebookUserProfileVO;
	}

	@RequestMapping("/login/facebook")
	public String loginFacebook() throws IOException {
		return "redirect:" + getAuthorizeUrl();
	}

	@RequestMapping("/checkFacebookId")
	public String checkFacebookId(String code, Model model, RedirectAttributes redirectAttributes) {
		logger.info("code : " + code);
		FacebookUserProfileVO userInfo = getFacebookUserInfo(code);
		logger.info("userInfo : " + userInfo.toString());
		Map<String, Object> userInfo2 = loginService.getUserInfoByEmail(userInfo.getEmail());
		if (userInfo2 == null) {
			model.addAttribute("facebookEmail", userInfo.getEmail());
			model.addAttribute("facebookName", userInfo.getName());
			return "user/join";
		}
		redirectAttributes.addFlashAttribute("facebookEmail", userInfo.getEmail());
		return "redirect:/loginForm?error5";

	}
	
//	@RequestMapping("/login")
//	public String login() {
//		logger.info("로그인 호출됨");
//		
//		return "redirect:/";
//	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoinForm() {
		return "user/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("UserInfo") User user) {
		User userInfo = loginService.checkUserById(user.getUemail());
		if (userInfo == null) {
			//sha256인코딩
			String pw = encoder.encoding(user.getUpassword());
			user.setUpassword(pw);
			
			loginService.saveUser(user);
			return "redirect:/";
		}
		return "user/joinError";
	}

	@RequestMapping("/checkId")
	public void checkId(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String uemail = request.getParameter("uemail");
		if (uemail.indexOf("@") != -1) {
			User userInfo = loginService.checkUserById(uemail);
			if (userInfo != null) {
				response.getWriter().write("Y");
			} else {
				response.getWriter().write("N");
			}
		} else {
			response.getWriter().write("N2");
		}
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
}