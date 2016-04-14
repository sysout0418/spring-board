package com.nbreds.projectPlanning.Project.requestProjects.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.requestProjects.Service.RequestService;

@Controller
public class RequestController {
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);

	@Autowired
	RequestService requestService;
	
	@RequestMapping("/requestProject")
	public String requestProject(HttpSession session, Model model) {
		String uno = String.valueOf(session.getAttribute("user_no"));
		
		List<Project> list = requestService.getRequestProjects(uno);
		
		model.addAttribute("list", list);
		
		return "/Project/requestProjects/requestProjects";
	}
	
	@RequestMapping("/updateStat/{pno}/{stat}")
	public String updateStat(@PathVariable("pno") int pno, @PathVariable("stat") String stat, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no"));
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("uno", uno);
		param.put("pno", pno);
		param.put("stat", stat);
		
		requestService.updateStat(param);
		
		return "/Project/requestProjects/requestProjects";
	}
}