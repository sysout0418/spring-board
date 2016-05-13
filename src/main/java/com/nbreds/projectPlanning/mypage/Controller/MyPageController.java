package com.nbreds.projectPlanning.mypage.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.login.Service.ShaEncoder;
import com.nbreds.projectPlanning.mypage.Service.MyPageService;

@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private ShaEncoder encoder;

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String userProfile(HttpSession session, Model model) {
		int uno = (int) session.getAttribute("user_no");
		logger.info("uno: " + uno);

		HashMap<String, String> userInfo = myPageService.getUserInfoByUno(uno);
		List<CodeTable> departmentList = myPageService.getAllDepartmentList();

		model.addAttribute("userInfo", userInfo);
		model.addAttribute("departmentList", departmentList);
		logger.info("userInfo : " + userInfo);
		logger.info("departmentList : " + departmentList);

		return "user/userSetting";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String userProfileEdit(String uemail, String uname, String uphoneno, String udepartment, String oldpassword, String newpassword1){
		if(myPageService.getLoadPassword(uemail).equals(encoder.encoding(oldpassword))){
			HashMap<String, Object> param = new HashMap<>();
			param.put("uemail", uemail);
			param.put("uname", uname);
			param.put("uphoneno", uphoneno);
			param.put("udepartment", udepartment);
			param.put("upassword", encoder.encoding(newpassword1));
			
			logger.info("param : " + param);
			
			//유저 데이터 변경
			myPageService.editProfile(param);
			
			return "redirect:/profile";
		}
		else{
			System.out.println("야니 현재 비번틀렸어");
			return "redirect:/profile";
		}
	}
}