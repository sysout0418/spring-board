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
		
		List<HashMap<String, Object>> list = listService.getPageList(param);
		for (HashMap<String, Object> project : list) {
			int pno = (int) project.get("pno");
			int countAllMilestone = listService.getCountAllMilestone(pno);
			double completeMilestonPercent = listService.getCountClosedMilestone(pno);
			project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
			logger.info("countAllMilestone: "+countAllMilestone);
			logger.info("completeMilestonPercent: "+completeMilestonPercent);
			logger.info("completeIssuePercent: "+project.get("completeIssuePercent"));
		}

		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		
		if(list.size() > 0)	model.addAttribute("list", list);
		else model.addAttribute("list", "none");
				
        return "Project/listProjects/listView";
	}
	
	//상세 프로젝트
	@RequestMapping(value = "/DetailProject/{pno}", method = RequestMethod.GET)
	public String  DetailView(@PathVariable("pno") int pno, Model model, HttpSession session) {
		HashMap<String, Object> project = listService.getProjectByPno(pno);
		List<HashMap<String, Object>> request = listService.getRequestMember(pno);
		
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
		
		return "redirect:/list";
	}
	
	//프로젝트 수정페이지
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String  UpdateView(int pno, Model model, HttpServletRequest request, @ModelAttribute("project") HashMap<String, Object> project) {
		project = listService.getProjectByPno(pno);
		List<User> allUserList = listService.getAllUser();
		List<ProjectMemberStat> participatedUserList = listService.getParticipateUserList(pno);
		List<String> skills = (List<String>)commonController.getCodeForCodeType((String)project.get("pdata"), "skills");
		
		List<String> dev = new ArrayList<>();
		List<String> design = new ArrayList<>();
		List<String> plan = new ArrayList<>();
		
		for(int i=0; i<skills.size(); i++){
			if(skills.get(i).substring(0, 3).equals("004"))	dev.add(skills.get(i).substring(3, 6));
			if(skills.get(i).substring(0, 3).equals("005"))	design.add(skills.get(i).substring(3, 6));
			if(skills.get(i).substring(0, 3).equals("006"))	plan.add(skills.get(i).substring(3, 6));
		}
		
		project.put("pdevelopment", dev);
		project.put("pdesign", dev);
		project.put("pplanning", dev);
		
		
		int uno = (int) project.get("uno");
		User user = listService.getUserForNo(uno);
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
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String  updateProject(@ModelAttribute("project") Project project, HttpServletRequest request, BindingResult result) {
		logger.info("pdata : "+project.getPdata());
		String requestUserNoList = request.getParameter("requestUserNoList");
		listService.updateProject(project, requestUserNoList);
		
		return "redirect:/DetailProject/"+project.getPno();
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
}