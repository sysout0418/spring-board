package com.nbreds.projectPlanning;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.common.Service.CommonService;
import com.nbreds.projectPlanning.Project.myProjects.Service.MyProjectService;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	public static List<User> USER_INFO;

	@Autowired
	CommonService commonService;

	@Autowired
	MyProjectService myProjectService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session, HttpServletRequest request) {
		logger.info("Index.jsp");
		// 유저 정보 저장
		USER_INFO = commonService.getAllUserNameAndNo();
		String uno = String.valueOf(session.getAttribute("user_no"));
		List<HashMap<String, Object>> list = myProjectService.getProjectByUno(uno);
		for (HashMap<String, Object> project : list) {
			int pno = (int) project.get("pno");
			int countAllMilestone = myProjectService.getCountAllMilestone(pno);
			double completeMilestonPercent = myProjectService.getCountClosedMilestone(pno);
			project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
			logger.info("countAllMilestone: " + countAllMilestone);
			logger.info("completeMilestonPercent: " + completeMilestonPercent);
			logger.info("completeIssuePercent: " + project.get("completeIssuePercent"));
		}

		if (list.size() > 0)
			model.addAttribute("list", list);
		else
			model.addAttribute("list", "none");

		model.addAttribute("uno", uno);

		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public @ResponseBody List<Project> searchProject(String item, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no"));
		HashMap<String, Object> param = new HashMap<>();
		param.put("uno", uno);
		param.put("item", item);
		List<Project> list = myProjectService.searchProject(param);

		return list;
	}

}