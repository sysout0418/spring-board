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
	
	@RequestMapping("/requestProject/{statement}")
	public String requestProject(@PathVariable("statement") String stat, HttpSession session, Model model) {
		String uno = String.valueOf(session.getAttribute("user_no"));
		
		List<Project> list = null;
		HashMap<String, Object> param = new HashMap<>();
		if (stat.equals("requested")) {
			param.put("uno", uno);
			param.put("stat", "000");
			list = requestService.getRequestProjects(param);
		} else if (stat.equals("accepted")) {
			param.put("uno", uno);
			param.put("stat", "001");
			list = requestService.getRequestProjects(param);
		} else if (stat.equals("declined")) {
			param.put("uno", uno);
			param.put("stat", "002");
			list = requestService.getRequestProjects(param);
		}else {}
		
		model.addAttribute("stat", stat);
		if(list.size() > 0)	model.addAttribute("list", list);
		else model.addAttribute("list", "none");
		
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
		
		return "redirect:/requestProject/requested";
	}
}