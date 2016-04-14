package com.nbreds.projectPlanning;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.myProjects.Service.MyProjectService;
import com.nbreds.projectPlanning.Project.registProject.Service.RegistService;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public static List<User> USER_INFO;

	@Autowired
	RegistService registService;
	
	@Autowired
	MyProjectService myProjectService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String  home(Model model, HttpSession session) {
		logger.info("Index.jsp");
		// 유저 정보 저장
		USER_INFO = registService.getAllUserNameAndNo();
		String uno = String.valueOf(session.getAttribute("user_no"));
		List<Project> list = myProjectService.getProjectByUno(uno);
		model.addAttribute("list", list);
		
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	//@RequestMapping("TEST")
	public @ResponseBody List<Project> searchProject(String item, Model model, HttpSession session) {
		System.out.println("item : " + item);
		String uno = String.valueOf(session.getAttribute("user_no"));
		HashMap<String, Object> param = new HashMap<>();
		param.put("uno", uno);
		param.put("item", item);
		List<Project> list = myProjectService.searchProject(param);
		
		System.out.println("===db에서 가져온 결과값===");
		for (Project project : list) {
			System.out.println("pname : " + project.getPname()+", pdetail : "+project.getPdetail() +", uno : " + project.getUname());
		}
		
		return list;
	}
}