package com.nbreds.projectPlanning.Project.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.listProjects.Service.ListService;
import com.nbreds.projectPlanning.Project.registProject.Service.RegistService;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class CommonController {
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	RegistService registService;
	
	@Autowired
	ListService listService;
	
	//ajax통신
	@RequestMapping("/nameList")
	public @ResponseBody List<String> GetNameList() {
		List<User> userList = registService.getAllUserNameAndNo();
		List<String> userNames = new ArrayList<String>();
		for (int i = 0; i < userList.size(); i++) {
			userNames.add(userList.get(i).getUname());
		}
		return userNames;
	}
	
	@RequestMapping("/requestProject")
	public String requestProject(HttpSession session, Model model) {
		String uno = String.valueOf(session.getAttribute("user_no"));
		List<Project> list = listService.getRequestProjects(uno);
		
		model.addAttribute("list", list);
		
		return "/Project/requestProjects/requestProjects";
	}
}
