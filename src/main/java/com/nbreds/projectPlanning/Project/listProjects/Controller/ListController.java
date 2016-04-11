package com.nbreds.projectPlanning.Project.listProjects.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

import com.nbreds.projectPlanning.Project.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.listProjects.Service.ListServiceImpl;

@Controller
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Autowired
	ListServiceImpl listService;
	
	//상주 프로젝트 리스트
	@RequestMapping("/list")
	public String  list(Model model, @RequestParam(defaultValue="1") int pageNo) {
		int rowsPerPage = 10; 
		int pagesPerGroup = 10; 

		int totalProjectNo = listService.getTotalProjectNo(); 
		int totalPageNo = totalProjectNo/rowsPerPage;
		
		if(totalProjectNo % rowsPerPage != 0){totalPageNo++;}
		int totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo % pagesPerGroup != 0){totalGroupNo++;}
		
		int groupNo = (pageNo-1)/pagesPerGroup +1;
		int startPageNo = (groupNo-1)*pagesPerGroup+1;
		int endPageNo = startPageNo + pagesPerGroup -1;
		
		if(groupNo == totalGroupNo) {endPageNo = totalPageNo;}
		
		HashMap<String,Integer> param = new HashMap<String,Integer>();
		int value =0;
		if(pageNo != 1) value = (pageNo-1)*rowsPerPage;
		param.put("pageNo", value);
		param.put("rowsPerPage", rowsPerPage);
		
		List<Project> list = listService.getPageList(param);
		for(int i = 0; i<list.size(); i++){
			String pdata = list.get(i).getPdata();		
			
			//한글화
			List<String> skills = (List<String>)getCodeForCodeType(pdata, "skills");
			String level = (String) getCodeForCodeType(pdata, "level");
			String pprogress = (String) getCodeForCodeType(pdata, "progress");
			
			if (skills.size() > 0) {
				list.get(i).setPskill(getCodeName(skills.get(0)));
			}
			List<String> lev = new ArrayList<>();
			lev.add(getCodeName(level));
			list.get(i).setPlevel(lev);
			
			//담당자 코드->한글			
			String uname = listService.getUserForNo(list.get(i).getUno()).getUname();
			list.get(i).setUname(uname);
			
		}
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("list", list);
				
        return "Project/listProjects/listView";
	}
	
	//상세 프로젝트
	@RequestMapping(value = "/DetailProject/{pno}", method = RequestMethod.GET)
	public String  DetailView(@PathVariable("pno") int pno, Model model) {
		Project project = listService.getProjectByPno(pno);
		String pdata = project.getPdata();
		
		//한글화
		List<String> skills = (List<String>)getCodeForCodeType(pdata, "skills");
		String level = (String) getCodeForCodeType(pdata, "level");
		String pprogress = (String) getCodeForCodeType(pdata, "progress");

		if (skills.size() > 0) {
			project.setPskill(getCodeName(skills.get(0)));
		}
		List<String> lev = new ArrayList<>();
		lev.add(getCodeName(level));
		project.setPlevel(lev);
		project.setPprogress(getCodeName(pprogress));
		
		//담당자 코드->한글
		String uname = listService.getUserForNo(project.getUno()).getUname();
		project.setUname(uname);
		
		//프로젝트 인원
		if(project.getPmember()=="")	project.setPmember("0명");
		else{
			String[] memberCount = project.getPmember().split(",");
			project.setPmember(memberCount.length+"명");
		}
		model.addAttribute("project", project);
		
		return "Project/listProjects/detailView";
	}
	
	//프로젝트 삭제
	@RequestMapping(value = "/DeleteProject", method = RequestMethod.GET)
	public String  DeleteProject(int pno) {
		listService.removeProject(pno);
		
		return "redirect:/list";
	}
	
	//프로젝트 수정페이지
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String  UpdateView(int pno, Model model, @ModelAttribute("project") Project project) {
		project = listService.getProjectByPno(pno);
		
		List<String> skills = (List<String>)getCodeForCodeType(project.getPdata(), "skills");
		String level = (String) getCodeForCodeType(project.getPdata(), "level");
		String pprogress = (String) getCodeForCodeType(project.getPdata(), "progress");
		
		List<String> dev = new ArrayList<>();
		List<String> design = new ArrayList<>();
		List<String> plan = new ArrayList<>();
		List<String> exp = new ArrayList<>();
		
		for(int i=0; i<skills.size(); i++){
			if(skills.get(i).substring(0, 3).equals("004"))	dev.add(skills.get(i).substring(3, 6));
			if(skills.get(i).substring(0, 3).equals("005"))	design.add(skills.get(i).substring(3, 6));
			if(skills.get(i).substring(0, 3).equals("006"))	plan.add(skills.get(i).substring(3, 6));
			if(skills.get(i).substring(0, 3).equals("007"))	exp.add(skills.get(i).substring(3, 6));
		}
		
		project.setPdevelopment(dev);
		project.setPdesign(design);
		project.setPplanning(plan);
		project.setPexperience(exp);
		List<String> lev = new ArrayList<>();
		lev.add(level.substring(3,6));
		project.setPlevel(lev);
		project.setPduedate(project.getPduedate());
		project.setPprogress(pprogress);
		
		
		int uno = project.getUno();
		User user = listService.getUserForNo(uno);
		if (model != null) {
			model.addAttribute("project", project);
			model.addAttribute("user",user);
		}
		
		return "Project/listProjects/updateView";
	}
	
	//프로젝트 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String  updateProject(@ModelAttribute("project") Project project, BindingResult result) {
		logger.info("pdata : "+project.getPdata());
		listService.updateProject(project);
		
		return "redirect:/DetailProject/"+project.getPno();
	}
	
	public String getCodeName(String code){
		HashMap<String,String> param = new HashMap<String,String>();
		if (code != null) {
			param.put("CODE_TYPE", code.substring(0, 3));
			param.put("CODE", code.substring(3, 6));
		}
		
		return listService.getCodeName(param).getCODE_NAME();
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
		
	@ModelAttribute("development")
	public List<CodeTable> getDevelopment(){
		List<CodeTable> devList = listService.getCodeTable("004");
		
		return devList;
	}
	
	@ModelAttribute("design")
	public List<CodeTable> getDesign(){
		List<CodeTable> devList = listService.getCodeTable("005");
		
		return devList;
	}
	
	@ModelAttribute("planning")
	public List<CodeTable> getPlanning(){
		List<CodeTable> devList = listService.getCodeTable("006");
		
		return devList;
	}
	
	@ModelAttribute("experience")
	public List<CodeTable> getExperience(){
		List<CodeTable> devList = listService.getCodeTable("007");
		
		return devList;
	}
	
	@ModelAttribute("level")
	public List<CodeTable> getLevel(){
		List<CodeTable> devList = listService.getCodeTable("008");
		
		return devList;
	}
}
