package com.nbreds.projectPlanning.Project.listProjects.Controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.Project.common.Controller.CommonController;
import com.nbreds.projectPlanning.Project.listProjects.Service.ListService;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Autowired
	CommonController commonController;
	
	@Autowired
	ListService listService;
	
	//상세 프로젝트
	@RequestMapping(value = "/DetailProject/{pno}", method = RequestMethod.GET)
	public String  DetailView(@PathVariable("pno") int pno, Model model, HttpSession session) {
		HashMap<String, Object> project = listService.getProjectByPno(pno);
		List<HashMap<String, Object>> request = listService.getRequestMember(pno);
		
		//필요 기술 한글화
		if(project.get("pdata") != ""){
			String[] pdata = ((String) project.get("pdata")).split(",");
			List<String> pdatas = new ArrayList<>();
			for (String code : pdata) {
				pdatas.add(commonController.getCodeName(code));
			}
			model.addAttribute("pdatas", pdatas);
		}
		
		//마일스톤으로 프로젝트 완료 퍼센테이지 계산
		int countAllMilestone = listService.getCountAllMilestone(pno);
		double completeMilestonPercent = listService.getCountClosedMilestone(pno);
		project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
		
		//요청 멤버 데이터 model추가
		if(request.size() > 0)		model.addAttribute("request", request);
		else model.addAttribute("request", "none");
		
		//Activity불러오기
		List<HashMap<String, Object>> activities = listService.getActivityByPno(pno);
		model.addAttribute("activity", activities);
		
		model.addAttribute("countAllMilestone", countAllMilestone);
		model.addAttribute("countAllIssue", listService.getcountAllIssue(pno));
		model.addAttribute("project", project);
		
		return "Project/listProjects/detailProject";
	}
	
	//프로젝트 삭제
	@RequestMapping(value = "/DeleteProject", method = RequestMethod.GET)
	public String  DeleteProject(int pno) {
		listService.removeProject(pno);
		
		return "redirect:/";
	}
	
	//프로젝트 수정페이지
	@RequestMapping(value = "update/{pno}", method = RequestMethod.GET)
	public String  UpdateView(@PathVariable("pno") int pno, Model model, HttpServletRequest request, @ModelAttribute("project") Project project) {
		project = listService.getUpdateProjectByPno(pno);
		List<User> allUserList = listService.getAllUser();
		List<ProjectMemberStat> participatedUserList = listService.getParticipateUserList(pno);
		
		List<String> dev = new ArrayList<>();
		List<String> design = new ArrayList<>();
		List<String> plan = new ArrayList<>();
		if(project.getPdata() != ""){
			String[] pdata = project.getPdata().split(",");
			for (String tmp : pdata) {
				if(tmp.substring(0, 3).equals("004"))	dev.add(tmp.substring(3, 6));
				if(tmp.substring(0, 3).equals("005"))	design.add(tmp.substring(3, 6));
				if(tmp.substring(0, 3).equals("006"))	plan.add(tmp.substring(3, 6));
			}
			project.setPdevelopment(dev);
			project.setPdesign(design);
			project.setPplanning(plan);
		}
		
		User user = listService.getUserForNo(project.getUno());
		if (model != null) {
			model.addAttribute("project", project);
			model.addAttribute("user",user);
			model.addAttribute("allUserList", allUserList);
			model.addAttribute("participatedUserList", participatedUserList);
			request.setAttribute("participatedUserList", participatedUserList);
		}
		
		return "Project/listProjects/updateView";
	}
	
	//프로젝트 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String  updateProject(@ModelAttribute("project") Project project, HttpServletRequest request, BindingResult result) {
		String requestUserNoList = request.getParameter("requestUserNoList");
		
		//pdata입력
		String pdata = "";
		if(project.getPdevelopment() != null)	for (String tmp : project.getPdevelopment())	pdata +="004"+tmp+",";
		if(project.getPdesign() != null)	for (String tmp : project.getPdesign())	pdata +="005"+tmp+",";
		if(project.getPplanning() != null)	for (String tmp : project.getPplanning())		pdata +="006"+tmp+",";
		project.setPdata(pdata);
		listService.updateProject(project, requestUserNoList);
		
		return "redirect:/"+project.getUno()+"/"+project.getPno();
	}
		
	@ModelAttribute("development")
	public List<CodeTable> getDevelopment() {
		List<CodeTable> devList = listService.getCodeTable("004");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　　");
		}
		return devList;
	}

	@ModelAttribute("design")
	public List<CodeTable> getDesign() {
		List<CodeTable> devList = listService.getCodeTable("005");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　  　");
		}
		return devList;
	}

	@ModelAttribute("planning")
	public List<CodeTable> getPlanning() {
		List<CodeTable> devList = listService.getCodeTable("006");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　  　");
		}
		return devList;
	}
}