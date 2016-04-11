package com.nbreds.projectPlanning.Project.registProject.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.Project.registProject.Service.RegistService;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class RegistController {
	private static final Logger logger = LoggerFactory.getLogger(RegistController.class);
	
	@Autowired
	RegistService registService;
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String Regist(Project project, HttpSession session, Model model) {
		int uno = Integer.parseInt(session.getAttribute("user_no").toString());
		
		User user = registService.getUserForNo(uno);
		model.addAttribute("user",user);
		
        return "Project/registProject/registProject";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String RegistProcess(@ModelAttribute("project")
							Project project, BindingResult result, @ModelAttribute("project2") ProjectMemberStat projectMS, HttpSession session) {
		project.setUno(Integer.parseInt(session.getAttribute("user_no").toString()));
		project.setPprogress("011000");
		registService.savePrjAndPrjMS(project, projectMS);
		return "redirect:/list";
	}
	
	@ModelAttribute("development")
	public List<CodeTable> getDevelopment(){
		List<CodeTable> devList = registService.getCodeTable("004");
		
		return devList;
	}
	
	@ModelAttribute("design")
	public List<CodeTable> getDesign(){
		List<CodeTable> devList = registService.getCodeTable("005");
		
		return devList;
	}
	
	@ModelAttribute("planning")
	public List<CodeTable> getPlanning(){
		List<CodeTable> devList = registService.getCodeTable("006");
		
		return devList;
	}
	
	@ModelAttribute("experience")
	public List<CodeTable> getExperience(){
		List<CodeTable> devList = registService.getCodeTable("007");
		
		return devList;
	}
	
	@ModelAttribute("level")
	public List<CodeTable> getLevel(){
		List<CodeTable> devList = registService.getCodeTable("008");
		
		return devList;
	}
}
