package com.nbreds.projectPlanning.Project.registProject.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

@Controller
public class RegistController {
	private static final Logger logger = LoggerFactory.getLogger(RegistController.class);

	@Autowired
	RegistService registService;

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String Regist(Project project, HttpSession session, Model model, HttpServletRequest request) {
		int uno = Integer.parseInt(session.getAttribute("user_no").toString());
		HashMap<String, Object> user = registService.getUserForNo(uno);
		List<User> allUserList = registService.getAllUser();
		String rowId = request.getParameter("rowId");
		
		if (rowId != null) {
			String[] rowIds = rowId.substring(0, rowId.length() - 1).split(",");
			List<String> rowIdList = new ArrayList<String>(Arrays.asList(rowIds));
			if (rowIds != null && !rowIds[0].equals("")) {
				for (int i = 0; i < rowIds.length; i++) {
					logger.info("rowId[" + i + "] : " + rowIds[i]);
				}
			}
			if (rowIdList.isEmpty()) {
				for (int i = 0; i < allUserList.size(); i++) {
					allUserList.get(i).setChecked(false);
				}
			} else {
				for (int i = 0; i < allUserList.size(); i++) {
					for (int j = 0; j < rowIdList.size(); j++) {
						if (allUserList.get(i).getUno() == Integer.parseInt(rowIdList.get(j))) {
							System.out.println("여기 들어옵니까");
							allUserList.get(i).setChecked(true);
						}
					}
				}
			}
		}
		
		model.addAttribute("user", user);
		model.addAttribute("allUserList", allUserList);
		
		return "Project/registProject/registProject";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String RegistProcess(@ModelAttribute("project") Project project, BindingResult result,
			HttpServletRequest request, HttpSession session) {
		String pdata = "";
		if(project.getPdevelopment() != null)	for (String tmp : project.getPdevelopment())	pdata +="004"+tmp+",";
		if(project.getPdesign() != null)	for (String tmp : project.getPdesign())	pdata +="005"+tmp+",";
		if(project.getPplanning() != null)	for (String tmp : project.getPplanning())		pdata +="006"+tmp+",";
		project.setPdata(pdata);
		
		project.setUno(Integer.parseInt(session.getAttribute("user_no").toString()));
		String requestedUserNoList = request.getParameter("requestUserNoList");
		registService.savePrjAndPrjMS(project, requestedUserNoList);
		
		return "redirect:/";
	}

	@ModelAttribute("development")
	public List<CodeTable> getDevelopment() {
		List<CodeTable> devList = registService.getCodeTable("004");

		return devList;
	}

	@ModelAttribute("design")
	public List<CodeTable> getDesign() {
		List<CodeTable> devList = registService.getCodeTable("005");

		return devList;
	}

	@ModelAttribute("planning")
	public List<CodeTable> getPlanning() {
		List<CodeTable> devList = registService.getCodeTable("006");

		return devList;
	}
}