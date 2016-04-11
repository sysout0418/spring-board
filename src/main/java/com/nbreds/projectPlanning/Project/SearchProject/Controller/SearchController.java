package com.nbreds.projectPlanning.Project.SearchProject.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nbreds.projectPlanning.Project.SearchProject.Service.SearchServiceImpl;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.util.PageBean;
import com.nbreds.projectPlanning.common.util.PageUtility;
import com.nbreds.projectPlanning.common.VO.CodeTable;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	SearchServiceImpl searchService;
	
	@RequestMapping("/search")
	public String  home(HttpServletRequest request, @ModelAttribute("project") Project project, Model model) throws Exception {
//		String word = request.getParameter("word");
//		String key = request.getParameter("key");
		String page = request.getParameter("pageNo");
		String[] datas = project.getPdata().split(",");
		logger.info("datas : " + datas);
		logger.info("pageNo : " + page);
		int pageNo;
		try {
			pageNo = Integer.parseInt(page);
		} catch (Exception e) {
			// page 정보가 전송되지 않은 경우 이므로 첫 페이지로 처리하기 위해
			pageNo = 1;
		}
		PageBean pageBean = new PageBean(datas, null, pageNo);
//		int rowsPerPage = 1; 
//		int pagesPerGroup = 10; 
//
//		int totalProjectNo = searchService.getTotalProjectNo(); 
//		int totalPageNo = totalProjectNo/rowsPerPage;
//		
//		if(totalProjectNo % rowsPerPage != 0){totalPageNo++;}
//		int totalGroupNo = totalPageNo / pagesPerGroup;
//		if(totalPageNo % pagesPerGroup != 0){totalGroupNo++;}
//		
//		int groupNo = (pageNo-1)/pagesPerGroup +1;
//		int startPageNo = (groupNo-1)*pagesPerGroup+1;
//		int endPageNo = startPageNo + pagesPerGroup -1;
//		
//		if(groupNo == totalGroupNo) {endPageNo = totalPageNo;}
//		
//		HashMap<String, Object> param = new HashMap<String, Object>();
//		int value =0;
//		if(pageNo != 1) value = (pageNo-1)*rowsPerPage;
//		String[] datas = project.getPdata().split(",");

//		param.put("pageNo", value);
//		param.put("rowsPerPage", rowsPerPage);
//		param.put("pdata", datas);
		
//		List<Project> list = searchService.getPageList(param);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pdata", datas);
		param.put("start", pageBean.getStart());
		param.put("interval", pageBean.getInterval());
		int totalCnt = searchService.totalCount(param);
		PageUtility bar = new PageUtility(pageBean.getInterval(), totalCnt, pageBean.getPageNo());
		pageBean.setPagelink(bar.getPageBar());
		List<Project> list = searchService.allProjectList(param);
		
		for(int i = 0; i < list.size(); i++){
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
			list.get(i).setPprogress(getCodeName(pprogress));
			
			//담당자 코드->한글
			String uname = searchService.getUserForNo(list.get(i).getUno()).getUname();
			list.get(i).setUname(uname);
		}
		
//		model.addAttribute("pagesPerGroup", pagesPerGroup);
//		model.addAttribute("totalPageNo", totalPageNo);
//		model.addAttribute("totalGroupNo", totalGroupNo);
//		model.addAttribute("groupNo", groupNo);
//		model.addAttribute("startPageNo", startPageNo);
//		model.addAttribute("endPageNo", endPageNo);
//		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("list", list);
		
        return "Project/searchProject/searchProject";
	}
	
	public String getCodeName(String code){
		HashMap<String,String> param = new HashMap<String,String>();
		param.put("CODE_TYPE", code.substring(0, 3));
		param.put("CODE", code.substring(3, 6));
		
		return searchService.getCodeName(param).getCODE_NAME();
	}
	
	@ModelAttribute("development")
	public List<CodeTable> getDevelopment(){
		List<CodeTable> devList = searchService.getCodeTable("004");
		
		return devList;
	}
	@ModelAttribute("design")
	public List<CodeTable> getDesign(){
		List<CodeTable> devList = searchService.getCodeTable("005");
		
		return devList;
	}
	@ModelAttribute("planning")
	public List<CodeTable> getPlanning(){
		List<CodeTable> devList= searchService.getCodeTable("006");
		
		return devList;
	}
	@ModelAttribute("experience")
	public List<CodeTable> getExperience(){
		List<CodeTable> devList = searchService.getCodeTable("007");
		
		return devList;
	}
	@ModelAttribute("level")
	public List<CodeTable> getLevel(){
		List<CodeTable> devList = searchService.getCodeTable("008");
		
		return devList;
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
