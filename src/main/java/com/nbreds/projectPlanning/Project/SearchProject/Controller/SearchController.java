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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbreds.projectPlanning.Project.SearchProject.Service.SearchService;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.common.Controller.CommonController;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.util.PageBean;
import com.nbreds.projectPlanning.common.util.PageUtility;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	CommonController commonController;
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/search")
	public String  home(HttpServletRequest request, Model model) throws Exception {
		String page = request.getParameter("pageNo");
		String datas = request.getParameter("pdata");
		String[] pdatas = null;
		if (datas != null && !datas.equals("")) {
			pdatas = datas.split(",");
			for (int i = 0; i < pdatas.length; i++) {
				logger.info("pdatas : " + pdatas[i]);
			}
			logger.info("pageNo : " + page);
		}
		int pageNo;
		try {
			pageNo = Integer.parseInt(page);
		} catch (Exception e) {
			// page 정보가 전송되지 않은 경우 이므로 첫 페이지로 처리하기 위해
			pageNo = 1;
		}
		logger.info("pageNo2 : " + pageNo);
		PageBean pageBean = new PageBean(pdatas, null, pageNo);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pdata", pdatas);
		param.put("start", pageBean.getStart());
		param.put("interval", pageBean.getInterval());
		
		int totalCnt = searchService.totalCount(param);
		logger.info("totalCnt : " + totalCnt);
		logger.info("start : " + pageBean.getStart());
		logger.info("Interval : " + pageBean.getInterval());
		PageUtility bar = new PageUtility(pageBean.getInterval(), totalCnt, pageBean.getPageNo());
		pageBean.setPagelink(bar.getPageBar());
		List<Project> list = searchService.allProjectList(param);
		
		List<Integer> completeIssuePercents = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			int pno = list.get(i).getPno();
			int countAllMilestone = searchService.getCountAllMilestone(pno);
			double completeMilestonPercent = searchService.getCountClosedMilestone(pno);
			completeIssuePercents.add((int) Math.round((completeMilestonPercent / countAllMilestone) * 100));
			list.get(i).setPprogress(completeIssuePercents.get(i));
			logger.info("countAllMilestone: "+countAllMilestone);
			logger.info("completeMilestonPercent: "+completeMilestonPercent);
		}
		
		request.setAttribute("pdatas", pdatas);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("completeIssuePercent", completeIssuePercents);
		if (list.isEmpty()) {
			model.addAttribute("list", "none");
		} else {
			model.addAttribute("list", list);
		}

		return "Project/searchProject/searchProject";
	}
	
	@ModelAttribute("development")
	public List<CodeTable> getDevelopment() {
		List<CodeTable> devList = searchService.getCodeTable("004");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　　");
		}
		return devList;
	}

	@ModelAttribute("design")
	public List<CodeTable> getDesign() {
		List<CodeTable> devList = searchService.getCodeTable("005");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　  　");
		}
		return devList;
	}

	@ModelAttribute("planning")
	public List<CodeTable> getPlanning() {
		List<CodeTable> devList = searchService.getCodeTable("006");
		for (int i = 0; i < devList.size(); i++) {
			devList.get(i).setCODE_NAME(devList.get(i).getCODE_NAME() + "　  　");
		}
		return devList;
	}
}
