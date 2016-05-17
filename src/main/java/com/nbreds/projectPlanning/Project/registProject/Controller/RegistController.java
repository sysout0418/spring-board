package com.nbreds.projectPlanning.Project.registProject.Controller;

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
import org.springframework.web.bind.annotation.RequestParam;

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
	public String Regist(Project project, HttpSession session, Model model) {
		int uno = Integer.parseInt(session.getAttribute("user_no").toString());
		HashMap<String, Object> user = registService.getUserForNo(uno);
		List<User> allUserList = registService.getAllUser();
		
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
		logger.info("pAmount : " + project.getPamount());
		
		return "redirect:/";
	}
	
	@RequestMapping("/getUserList")
	public String getUserList(Model model, @RequestParam(value="checkArray[]") List<String> arrayParams,
			@RequestParam(value="index") int index, HttpServletRequest request) {
		logger.info("index : " + index);
		HttpSession session = request.getSession();
		session.removeAttribute("index");
		session.setAttribute("index", index);
		int sessionIndex = Integer.parseInt(session.getAttribute("index").toString());

		List<User> allUserList = registService.getAllUser();
		if (arrayParams != null && !arrayParams.get(0).equals("")) {
			// 넘어온 체크박스값 로그 찍어보자
			for (int i = 0; i < arrayParams.size(); i++) {
				logger.info("arrayParams[" + i + "] : " + arrayParams.get(i));
			}
			
			// 체크박스 체크 여부가 true인 객체만 찾아서 true로 바꾸기
			for (int i = 0; i < allUserList.size(); i++) {
				allUserList.get(i).setChecked(false);
				for (int j = 0; j < arrayParams.size(); j++) {
					if (allUserList.get(i).getUno() == Integer.parseInt(arrayParams.get(j))) {
						allUserList.get(i).setChecked(true);
					}
				}
			}
			
			// 체크박스 값이 잘 변경 됐는지 로그 찍어보자
			for (int i = 0; i < allUserList.size(); i++) {
				logger.info("allUserList.get(" + i + ").getIsChecked() : " + allUserList.get(i).getIsChecked());
			}
		} else {
			// 넘어온 체크박스값 없으면 모든 객체 체크박스값도 false로
			for (int i = 0; i < allUserList.size(); i++) {
				allUserList.get(i).setChecked(false);
			}
		}
		model.addAttribute("allUserList", allUserList);
		model.addAttribute("index", sessionIndex);
		
		return "Project/registProject/userList";
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