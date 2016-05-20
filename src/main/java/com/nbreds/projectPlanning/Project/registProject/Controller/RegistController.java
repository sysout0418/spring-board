package com.nbreds.projectPlanning.Project.registProject.Controller;

import java.util.HashMap;
import java.util.Iterator;
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
import com.nbreds.projectPlanning.Project.registProject.Service.RegistService;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.issues.VO.Label;

@Controller
public class RegistController {
	private static final Logger logger = LoggerFactory.getLogger(RegistController.class);

	@Autowired
	RegistService registService;

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String Regist(Project project, HttpSession session, Model model) {
		int uno = Integer.parseInt(session.getAttribute("user_no").toString());
		
		HashMap<String, Object> user = registService.getUserForNo(uno);
		List<Label> allLabelList = registService.getAllLabel();
		model.addAttribute("user", user);
		model.addAttribute("labels", allLabelList);
		
		return "Project/registProject/registProject";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String RegistProcess(@ModelAttribute("project") Project project, BindingResult result,
			HttpSession session) {
		String pdata = "";
		if(project.getPdevelopment() != null)	for (String tmp : project.getPdevelopment())	pdata +="004"+tmp+",";
		if(project.getPdesign() != null)	for (String tmp : project.getPdesign())	pdata +="005"+tmp+",";
		if(project.getPplanning() != null)	for (String tmp : project.getPplanning())		pdata +="006"+tmp+",";
		project.setPdata(pdata);
		
		project.setUno(Integer.parseInt(session.getAttribute("user_no").toString()));
		
		registService.savePrjAndPrjMS(project);
		
		return "redirect:/";
	}
	@ModelAttribute("allUserList")
	public List<User> allUserList(HttpSession session) {
		int uno = (int) session.getAttribute("user_no");
		List<User> allUserList = registService.getAllUser();
		
		Iterator<User> itr = allUserList.iterator();
		//자기자신 제외
		while(itr.hasNext()){
			if(itr.next().getUno() == uno)
				itr.remove();
		}

		return allUserList;
	}
	
	@ModelAttribute("development")
	public List<CodeTable> getDevelopment() {
		List<CodeTable> devList = registService.getCodeTable("004");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　　");
		}
		return devList;
	}

	@ModelAttribute("design")
	public List<CodeTable> getDesign() {
		List<CodeTable> devList = registService.getCodeTable("005");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　  　");
		}
		return devList;
	}

	@ModelAttribute("planning")
	public List<CodeTable> getPlanning() {
		List<CodeTable> devList = registService.getCodeTable("006");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　  　");
		}
		return devList;
	}
}