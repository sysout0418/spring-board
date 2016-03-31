package com.nbreds.projectPlanning.Project.myProjects.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.myProjects.Service.MyProjectService;

@Controller
public class MyProjectController {
	private static final Logger logger = LoggerFactory.getLogger(MyProjectController.class);

	@Autowired
	MyProjectService myProjectService;
	
	@RequestMapping("/{uno}/{pno}")
	public String  home(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model) {
		Project project = myProjectService.getProjectByPno(pno);
		String pdata = project.getPdata();
		
		//한글화
		List<String> skills = (List<String>)getCodeForCodeType(pdata, "skills");
		String level = (String) getCodeForCodeType(pdata, "level");
		String pprogress = (String) getCodeForCodeType(pdata, "progress");

		project.setPskill(getCodeName(skills.get(0)));
		List<String> lev = new ArrayList<>();
		lev.add(getCodeName(level));
		project.setPlevel(lev);
		project.setPprogress(getCodeName(pprogress));
		
		//담당자 코드->한글
		String uname = myProjectService.getUserForNo(project.getUno()).getUname();
		project.setUname(uname);
		
		//프로젝트 인원
		if(project.getPmember()=="")	project.setPmember("0명");
		else{
			String[] memberCount = project.getPmember().split(",");
			project.setPmember(memberCount.length+"명");
		}
		model.addAttribute("project", project);
		
		return "/Project/myProjects/selectedProject";
	}
	
	public String getCodeName(String code){
		HashMap<String,String> param = new HashMap<String,String>();
		param.put("CODE_TYPE", code.substring(0, 3));
		param.put("CODE", code.substring(3, 6));
		
		return myProjectService.getCodeName(param).getCODE_NAME();
	}
	
	private Object getCodeForCodeType(String pdata, String type) {
		String[] data = pdata.split(",");
		
		List <String>skills = new ArrayList<String>();
		String level = "";
		String progress = "";
		
		for (String str : data) {
			String sub = str.substring(0,3);
			if(sub.equals("004") || sub.equals("005") || sub.equals("006") || sub.equals("007"))
				skills.add(str);
			else if(sub.equals("008"))
				level = str;
			else if(sub.equals("011"))
				progress = str;
		}
		
		if(type.equals("skills")) return skills;
		if(type.equals("level")) return level;
		if(type.equals("progress")) return progress;
		else return "fail";
	}
}