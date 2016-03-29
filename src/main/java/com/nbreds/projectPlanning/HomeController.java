package com.nbreds.projectPlanning;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.myProjects.Service.myProjectsService;
import com.nbreds.projectPlanning.Project.registProject.Service.registService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public static List<User> USER_INFO;
	
	@Autowired
	registService service;
	
	@Autowired
	myProjectsService myProjectsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String  home(Model model, HttpSession session) {
		logger.info("Index.jsp");
		// 유저 정보 저장
		USER_INFO = service.getAllUserNameAndNo();
		
		if(session.getAttribute("user_no") != null){
			String uno = String.valueOf(session.getAttribute("user_no"));
			List<Project> list = myProjectsService.getProjectByUno(uno);
			for (Project project : list) {
				
				String uname = myProjectsService.getUserForNo(project.getUno()).getUname();
				project.setUname(uname);
			}
			
			model.addAttribute("list", list);
			
			return "Project/myProjects/myProjects";
		}
		else
			return "index";
	}
	
	@RequestMapping("/login")
	public String  login(HttpSession session, HttpServletResponse response) {
		session.setAttribute("user_no", 39);
		
        return "Project/myProjects/myProjects";
	}
	
	@RequestMapping("/logout")
	public String  logout(HttpSession session) {
		session.removeAttribute("user_no");
		
        return "index";
	}
}
