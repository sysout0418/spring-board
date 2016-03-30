package com.nbreds.projectPlanning.issues.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.nbreds.projectPlanning.HomeController;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.registProject.Service.registService;
import com.nbreds.projectPlanning.issues.Service.issuesService;
import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.label.Service.labelService;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.Service.milestonesService;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Controller
public class issuesController {
	private static final Logger logger = LoggerFactory.getLogger(issuesController.class);

	@Autowired
	registService registService;
	
	@Autowired
	issuesService issuesService;

	@Autowired
	labelService labelService;

	@Autowired
	milestonesService milestoneService;

	@RequestMapping("/issues")
	public String home(Model model) {
		return "/issues/issues";
	}

	// statement에 따라 issue 리스트를 불러오는 기능
	@RequestMapping("/{uno}/{pno}/issues/{statement}")
	public String issuesList(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("statement") String stat, Model model) {
		List<Issues> issuesList = new ArrayList<Issues>();
		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = registService.getAllUserNameAndNo();
		Map<String, Object> param = new HashMap<String, Object>();
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("istatement", "000");
			issuesList = issuesService.getIssuesByPno(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = labelService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("istatement", "001");
			issuesList = issuesService.getIssuesByPno(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = labelService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else {
			param.put("pno", pno);
			issuesList = issuesService.getIssuesByPno(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = labelService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		}
		model.addAttribute("stat", stat);
		model.addAttribute("issuesList", issuesList);
		model.addAttribute("userList", userList);

		return "/Project/myProjects/Issues/issues";
	}

	// ino로 특정 issue 정보 불러오기
	@RequestMapping("/{uno}/{pno}/issue/{ino}")
	public String detailIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino,
			Model model) {
		Issues issues = issuesService.getIssuesByIno(ino);
		List<Label> labelList = labelService.getLabelsByIno(issues.getIno());
		issues.setLabels(labelList);
		model.addAttribute("issues", issues);

		return "issues/detailIssue";
	}

	// issues 등록 폼으로
	@RequestMapping("/{uno}/{pno}/issues/new")
	public String newIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model) {
		List<Label> labels = labelService.getAllLabel();
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("labels", labels);

		return "/issues/newIssue";
	}

	// issue 등록 요청
	@RequestMapping("/issues/regist")
	public String registIssue(int uno, int pno, @ModelAttribute("Issues") Issues issues, BindingResult result) {
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());
		logger.info("weight : " + issues.getIweight());
		logger.info("pno : " + issues.getPno());
		issuesService.saveIssues(issues);

		return "redirect:/" + uno + "/" + pno + "/issues/open";
	}

	// issue 수정 페이지
	@RequestMapping(value = "/issues/edit/{uno}/{pno}/{ino}", method = RequestMethod.GET)
	public String editFormIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("ino") int ino, @ModelAttribute("issues") Issues issues, Model model) {
		issues = issuesService.getIssuesByIno(ino);
		List<Label> labelList = labelService.getAllLabel();
		logger.info("---------------update page------------------");
		logger.info("ino : " + issues.getIno());
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());
		logger.info("weight : " + issues.getIweight());

		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("issues", issues);
		model.addAttribute("labelList", labelList);

		return "/issues/editIssue";
	}

	// issue 수정
	@RequestMapping(value = "/issues/edit", method = RequestMethod.POST)
	public String editIssue(int uno, int pno, @ModelAttribute("Issues") Issues issues, BindingResult result) {
		logger.info("---------------updating page------------------");
		logger.info("ino : " + issues.getIno());
		logger.info("title : " + issues.getItitle());
		logger.info("weight : " + issues.getIweight());

		issuesService.updateIssueByIno(issues);

		return "redirect:/" + uno + "/" + pno + "/issues/open";
	}

	@RequestMapping("/issues/close/{uno}/{pno}/{ino}")
	public String closeIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ino", String.valueOf(ino));
		param.put("istatement", "001");
		issuesService.closeIssue(param);
		return "redirect:/" + uno + "/" + pno + "/issues/closed";
	}
	
	@RequestMapping("/{uno}/{pno}/issues/{statement}/{searchUno}")
	public String searchIssueByUno(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("statement") String stat, 
			@PathVariable("searchUno") int searchUno, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Issues> issuesList = new ArrayList<Issues>();
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("searchUno", searchUno);
			param.put("istatement", "000");
			issuesList = issuesService.getIssuesByPno(param);
		} if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("searchUno", searchUno);
			param.put("istatement", "001");
			issuesList = issuesService.getIssuesByPno(param);
		} else {
			param.put("pno", pno);
			param.put("searchUno", searchUno);
			issuesList = issuesService.getIssuesByPno(param);
		}
		
		model.addAttribute("issuesList", issuesList);
		
		return "/Project/myProjects/Issues/issues";
	}
	
	// issue 삭제
//	@RequestMapping("/issues/remove/{uno}/{pno}/{ino}")
//	public String remove(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino) {
//		issuesService.removeIssues(ino);
//
//		return "redirect:/" + uno + "/" + pno + "/issues/open";
//	}

	// @RequestMapping("/issues")
	// public String home(Model model) {
	// List<Issues> issueList = issuesService.getAllIssues();
	// List<Label> labelList = new ArrayList<Label>();
	// Set<Label> labelList = new HashSet<Label>();
	// for (int i = 0; i < issueList.size(); i++) {
	// labelList.addAll(labelService.getLabelsByIno(issueList.get(i).getIno()));
	// issueList.get(i).setLabels(labelList);
	// }
	// model.addAttribute("issuesList", issueList);
	// user 리스트
	// List<User> users = HomeController.USER_INFO;

	// milestone 리스트

	// label 리스트
	// List<Label> labels = labelService.getAllLabel();
	//
	// model.addAttribute("users", users);
	// model.addAttribute("labels", labels);
	// return "issues/issues";
	// }

	// @RequestMapping(value = "/issues", method = RequestMethod.GET)
	// public String home1(Model model) {
	// List<Issues> issueList = issuesService.getAllIssues();
	// List<Label> labelList = new ArrayList<Label>();
	// Set<Label> labelList = new HashSet<Label>();
	// for (int i = 0; i < issueList.size(); i++) {
	// labelList.addAll(labelService.getLabelsByIno(issueList.get(i).getIno()));
	// issueList.get(i).setLabels(labelList);
	// }
	// model.addAttribute("issuesList", issueList);
	// user 리스트
	// List<User> users = HomeController.USER_INFO;

	// milestone 리스트

	// label 리스트
	// List<Label> labels = labelService.getAllLabel();
	//
	// model.addAttribute("users", users);
	// model.addAttribute("labels", labels);
	// return "issues/issues";
	// }

	// @RequestMapping("/{uno}/{pno}/issues")
	// public String issues(@PathVariable("uno") int uno, @PathVariable("pno")
	// int pno, Model model) {
	// model.addAttribute("uno", uno);
	// model.addAttribute("pno", pno);
	//
	// return "/Project/myProjects/Issues/issues";
	// }

	// @RequestMapping("/issues/new")
	// public String newMilestone(Model model) {
	// List<User> users = HomeController.USER_INFO;
	// model.addAttribute("users", users);
	// int uno =
	// Integer.parseInt(session.getAttribute("user_no").toString());
	// User user = issuesService.getUserForNo(uno);
	// model.addAttribute("user",user);
	// model.addAttribute("uno", uno);
	// model.addAttribute("pno", pno);

	// return "/issues/newIssue";
	// }

	// @RequestMapping("/issues/regist")
	// public String regist(@ModelAttribute("issues") Issues issues,
	// BindingResult result) {
	// logger.info("title : " + issues.getItitle());
	// logger.info("description : " + issues.getIdescription());
	// logger.info("weight : " + issues.getIweight());
	// logger.info("statement : " + issues.getIstatement());
	// logger.info("mno : " + issues.getMno());
	// logger.info("uno : " + issues.getUno());
	// logger.info("pno : " + issues.getPno());
	// // service.saveMilestone(milestone);
	//
	// return "/Project/myProjects/Issues/issues";
	// }

	// @RequestMapping("/registIssue")
	// public String registIssue(@ModelAttribute("issues") Issues issues,
	// BindingResult result) {
	// logger.info("title : " + issues.getItitle());
	// logger.info("description : " + issues.getIdescription());
	// logger.info("weight : " + issues.getIweight());
	// logger.info("statement : " + issues.getIstatement());
	// logger.info("mno : " + issues.getMno());
	// logger.info("uno : " + issues.getUno());
	// logger.info("pno : " + issues.getPno());
	//
	// issuesService.saveIssues(issues);
	//
	// return "redirect:/issues";
	// }

	// @RequestMapping(value = "/DetailIssue", method = RequestMethod.GET)
	// public String detailView(int ino, Model model) {
	// System.out.println(ino);
	// // Issues issues = issuesService.getIssuesByIno(ino);
	// // model.addAttribute("issue", issues);
	//
	// return "/issues/detailIssue";
	// }

}
