package com.nbreds.projectPlanning;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.common.Service.CommonService;
import com.nbreds.projectPlanning.Project.myProjects.Service.MyProjectService;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.login.VO.FacebookUserProfileVO;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public static List<User> USER_INFO;

	@Autowired
	CommonService commonService;
	
	@Autowired
	MyProjectService myProjectService;
	
	@Inject
	ConnectionFactoryLocator conFactoryLocator;
	
	OAuth2Operations auth2Operations;
	
	FacebookConnectionFactory connectionFactory;
	
//	@Autowired
//	private FacebookConnectionFactory connectionFactory;
//		
//	@Autowired
//	private OAuth2Parameters oAuth2Parameters;
//		
//	public String getAuthorizeUrl(){
//		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
//		String authorizeUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
//		return authorizeUrl;
//	}
//	
//	public FacebookUserProfileVO getFacebookUserInfo(String code) {
//		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
//		
//		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, "/", null);
//		String accessToken = accessGrant.getAccessToken();
//		Long expireTime =  accessGrant.getExpireTime();
//		if (expireTime != null && expireTime < System.currentTimeMillis()) {
//			accessToken = accessGrant.getRefreshToken();
//			logger.info("accessToken is expired. refresh token = {}" , accessToken);
//		}
//		
//		Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
//		Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
//		
//		UserOperations userOperations = facebook.userOperations();
//		FacebookProfile facebookProfile = null;
//		try {
//			facebookProfile = userOperations.getUserProfile();
//		} catch (MissingAuthorizationException   e) {
//			e.printStackTrace();
//			// TO DO throw custom exception...
//		} catch (ApiException  e) {
//			e.printStackTrace();
//			// TO DO throw custom exception...
//		}
//		FacebookUserProfileVO facebookUserProfileVO = new FacebookUserProfileVO(facebookProfile.getId(),
//																				facebookProfile.getName(),
//																				facebookProfile.getFirstName(),
//																				facebookProfile.getLastName());
//		
//		logger.info("Facebook user login is success. {}", facebookUserProfileVO.toString());
//		return facebookUserProfileVO;
//	}
	
	public FacebookUserProfileVO getFacebookUserInfo(String code) {
		AccessGrant accessGrant = auth2Operations.exchangeForAccess(code, "http://localhost:8080/joinByFacebook", null);
		Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
		
		// FacebookTemplate 클래스는 인증이 없어도 기본적인 페이스북 api를 이용할 수 있도록 만듬.
		Facebook facebook = (Facebook)(connection != null ? connection.getApi() : new FacebookTemplate());
		 
		FacebookProfile profile = facebook.userOperations().getUserProfile();
		return new FacebookUserProfileVO(profile.getEmail(),
										profile.getName());
	}
	
	@RequestMapping(value = "/signin/facebook", method = RequestMethod.POST)
	public void fb(HttpServletRequest req,HttpServletResponse res) throws IOException {
		//facebook이란 id로 연결객체 생성
		connectionFactory = (FacebookConnectionFactory) conFactoryLocator.getConnectionFactory("facebook");
 
		//OAuth2 인증을 사용하겠다.
		auth2Operations = connectionFactory.getOAuthOperations();
		OAuth2Parameters parameters = new OAuth2Parameters();
		//email, user_about_me, user_birthday, user_hometown, user_website, offline_access, read_stream, publish_stream, read_friendlists
		parameters.setScope("email");
		//Redirection 주소
		parameters.setRedirectUri("http://localhost:8080/joinByFacebook");
		//권한코드 생성
		String authorizeUrl = auth2Operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, parameters);
		//access 토큰요청
		res.sendRedirect(authorizeUrl);
	}
	
	@RequestMapping("/joinByFacebook")
	public String joinByFacebook(String code) {
		if (code != null) {
			AccessGrant accessGrant = auth2Operations.exchangeForAccess(code, "http://localhost:8080/joinByFacebook", null);
			Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
			
			// FacebookTemplate 클래스는 인증이 없어도 기본적인 페이스북 api를 이용할 수 있도록 만듬.
			Facebook facebook = (Facebook)(connection != null ? connection.getApi() : new FacebookTemplate());
			 
			FacebookProfile profile = facebook.userOperations().getUserProfile();
			//FacebookUserProfileVO userInfo = getFacebookUserInfo(code);
			logger.info("code : " + code);
			logger.info("getAbout : " + profile.getAbout());
			logger.info("getName : " + profile.getName());
			logger.info("getFirstName : " + profile.getFirstName());
			logger.info("getLastName : " + profile.getLastName());
			logger.info("getMiddleName : " + profile.getMiddleName());
			logger.info("getId : " + profile.getId());
			logger.info("getEmail : " + profile.getEmail());
			logger.info("getBio : " + profile.getBio());
			logger.info("getBirthday : " + profile.getBirthday());
			logger.info("getGender : " + profile.getGender());
			logger.info("getLink : " + profile.getLink());
			logger.info("getPolitical : " + profile.getPolitical());
			logger.info("getQuotes" + profile.getQuotes());
			logger.info("getRelationshipStatus : " + profile.getRelationshipStatus());
			logger.info("getReligion : " + profile.getReligion());
			logger.info("getThirdPartyId : " + profile.getThirdPartyId());
			logger.info("getUsername : " + profile.getUsername());
			logger.info("getWebsite : " + profile.getWebsite());
			logger.info("getTimezone : " + profile.getTimezone());
			logger.info("getAgeRange : " + profile.getAgeRange());
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String  home(Model model, HttpSession session, HttpServletRequest request) {
		// 페북 연동 테스트
//		String code = request.getParameter("code");
//		if (code != null) {
//			FacebookUserProfileVO userInfo = getFacebookUserInfo(code);
//			logger.info("code : " + code);
//			logger.info("ID : " + userInfo.getUserId());
//			logger.info("name : " + userInfo.getUserName());
//			logger.info("firstName : " + userInfo.getFirstName());
//			logger.info("lastName : " + userInfo.getLastName());
//		}
		
		logger.info("Index.jsp");
		// 유저 정보 저장
		USER_INFO = commonService.getAllUserNameAndNo();
		String uno = String.valueOf(session.getAttribute("user_no"));
		List<HashMap<String, Object>> list = myProjectService.getProjectByUno(uno);
		for (HashMap<String, Object> project : list) {
			int pno = (int) project.get("pno");
			int countAllMilestone = myProjectService.getCountAllMilestone(pno);
			double completeMilestonPercent = myProjectService.getCountClosedMilestone(pno);
			project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
			logger.info("countAllMilestone: "+countAllMilestone);
			logger.info("completeMilestonPercent: "+completeMilestonPercent);
			logger.info("completeIssuePercent: "+project.get("completeIssuePercent"));
		}
		
		if(list.size() > 0)	model.addAttribute("list", list);
		else model.addAttribute("list", "none");
		
		model.addAttribute("uno", uno);
		
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public @ResponseBody List<Project> searchProject(String item, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no"));
		HashMap<String, Object> param = new HashMap<>();
		param.put("uno", uno);
		param.put("item", item);
		List<Project> list = myProjectService.searchProject(param);
		
		return list;
	}
	
}