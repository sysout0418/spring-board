package com.nbreds.projectPlanning.mypage.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.mypage.Service.MyPageService;

@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("/profile")
	public String userProfile(HttpSession session, Model model){
		int uno = (int) session.getAttribute("user_no");
		logger.info("uno: " + uno);
		
		User userInfo = myPageService.getUserInfoByUno(uno);
		List<CodeTable> departmentList = myPageService.getAllDepartmentList();
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("departmentList", departmentList);
		logger.info("userInfo : " + userInfo);
		logger.info("departmentList : " + departmentList);
		
		return "user/userSetting";
	}
}