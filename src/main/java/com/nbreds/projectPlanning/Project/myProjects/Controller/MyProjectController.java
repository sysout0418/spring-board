package com.nbreds.projectPlanning.Project.myProjects.Controller;

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
		
		int countAllMilestone = myProjectService.getCountAllMilestone(pno);
		double completeMilestonPercent = myProjectService.getCountClosedMilestone(pno);
		project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
		
		model.addAttribute("request", request);
		model.addAttribute("project", project);
		model.addAttribute("userCnt", request.size());
		
		return "/Project/myProjects/selectedProject";
	}
}