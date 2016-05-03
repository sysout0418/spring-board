package com.nbreds.projectPlanning.Project.myProjects.Controller;

import java.util.ArrayList;
import java.util.Date;
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

import com.nbreds.projectPlanning.Project.common.Controller.CommonController;
import com.nbreds.projectPlanning.Project.myProjects.Service.MyProjectService;

@Controller
public class MyProjectController {
	private static final Logger logger = LoggerFactory.getLogger(MyProjectController.class);
	
	@Autowired
	CommonController commonController;
	
	@Autowired
	MyProjectService myProjectService;
	
	@RequestMapping("/{uno}/{pno}")
	public String  home(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model, HttpSession session) {
		HashMap<String, Object> project = myProjectService.getProjectByPno(pno);
		List<HashMap<String, Object>> request = myProjectService.getRequestMember(pno);
		
		//필요 기술 한글화
		if(project.get("pdata").equals(null)){
			String[] pdata = ((String) project.get("pdata")).split(",");
			List<String> pdatas = new ArrayList<>();
			for (String code : pdata) {
				pdatas.add(commonController.getCodeName(code));
			}

			model.addAttribute("pdatas", pdatas);
		}
		
		//마일스톤으로 프로젝트 완료 퍼센테이지 계산
		int countAllMilestone = myProjectService.getCountAllMilestone(pno);
		double completeMilestonPercent = myProjectService.getCountClosedMilestone(pno);
		project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
		
		//요청 멤버 데이터 model추가
		if(request.size() > 0)		model.addAttribute("request", request);
		else model.addAttribute("request", "none");
		
		//Activity불러오기
		List<HashMap<String, Object>> activities = myProjectService.getActivityByPno(pno);
		model.addAttribute("activity", activities);
		
		model.addAttribute("countAllMilestone", countAllMilestone);
		model.addAttribute("countAllIssue", myProjectService.getcountAllIssue(pno));
		model.addAttribute("project", project);
		
		return "/Project/myProjects/selectedProject";
	}
}