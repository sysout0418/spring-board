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
		Project project = myProjectService.getProjectByPno(pno);
		List<HashMap<String, Object>> request = myProjectService.getRequestMember(pno);
		
		String pdata = project.getPdata();
		//한글화
		List<String> skills = (List<String>)commonController.getCodeForCodeType(pdata, "skills");
		String pprogress = (String) commonController.getCodeForCodeType(pdata, "progress");

		project.setPskill(commonController.getCodeName(skills.get(0)));
		project.setPprogress(commonController.getCodeName(pprogress));
		
		//담당자 코드->한글
		String uname = myProjectService.getUserForNo(project.getUno()).getUname();
		project.setUname(uname);
		
		model.addAttribute("request", request);
		model.addAttribute("project", project);
		
		return "/Project/myProjects/selectedProject";
	}
}