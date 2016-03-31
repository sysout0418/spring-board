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
import org.springframework.web.bind.annotation.RequestParam;

import com.nbreds.projectPlanning.HomeController;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.registProject.Service.RegistServiceImpl;
import com.nbreds.projectPlanning.issueLabel.Service.IssueLabelServiceImpl;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.Service.IssueService;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.label.Service.LabelServiceImpl;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.Service.MilestonesServiceImpl;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Controller
public class IssueController {
	private static final Logger logger = LoggerFactory.getLogger(IssueController.class);

	@Autowired
	IssueService issuesService;

	@RequestMapping("/issues")
	public String home(Model model) {
		return "/issues/issues";
	}

	// statement에 따라 issue 리스트를 불러오는 기능
	@RequestMapping("/{uno}/{pno}/issues/{statement}")
	public String issuesList(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("statement") String stat, Model model) {
		logger.info("uno : " + uno);
		logger.info("pno : " + pno);
		logger.info("statement : " + stat);
		List<Issue> issuesList = new ArrayList<Issue>();
		List<Label> labelList = new ArrayList<Label>();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> allMilestoneList = issuesService.getAllMilestone();
		List<User> userList = issuesService.getAllUserNameAndNo();
		Map<String, Object> param = new HashMap<String, Object>();
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("uno", uno);
			param.put("istatement", "000");
			issuesList = issuesService.getIssuesByPno(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("uno", uno);
			param.put("istatement", "001");
			issuesList = issuesService.getIssuesByPno(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else {
			param.put("pno", pno);
			param.put("uno", uno);
			issuesList = issuesService.getIssuesByPno(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		}
		model.addAttribute("stat", stat);
		model.addAttribute("issuesList", issuesList);
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("allMilestoneList", allMilestoneList);

		return "/Project/myProjects/Issues/issues";
	}
	
//	@RequestMapping(value = "/{uno}/{pno}/issues/{statement}", method = RequestMethod.GET)
//	public String searchIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
//			@PathVariable("statement") String stat, @RequestParam("userNo") int userNo,
//			@RequestParam("mno") int mno, @RequestParam("lno") int lno, 
//			@RequestParam("weight") int weight, Model model) {
//		System.out.println(userNo);
//		return "";
//	}

	// ino로 특정 issue 정보 불러오기
	@RequestMapping("/{uno}/{pno}/issue/{ino}")
	public String detailIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino,
			Model model) {
		Issue issues = issuesService.getIssuesByIno(ino);
		List<Label> labelList = issuesService.getLabelsByIno(issues.getIno());
		issues.setLabels(labelList);
		model.addAttribute("issues", issues);

		return "issues/detailIssue";
	}

	// issues 등록 폼으로
	@RequestMapping("/{uno}/{pno}/issues/new")
	public String newIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model) {
		List<Label> labels = issuesService.getAllLabel();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Milestone> allMilestoneList = issuesService.getAllMilestone();
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("labels", labels);
		model.addAttribute("userList", userList);
		model.addAttribute("allMilestoneList", allMilestoneList);

		return "/issues/newIssue";
	}

	// issue 등록 요청
	@RequestMapping("/issues/regist")
	public String registIssue(int uno, int pno, @ModelAttribute("Issues") Issue issues, @ModelAttribute("Issues2") IssueLabel issueLabel, BindingResult result) {
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());
		logger.info("weight : " + issues.getIweight());
		logger.info("pno : " + issues.getPno());
		logger.info("lno : " + issues.getLno());
		String[] lnos = String.valueOf(issues.getLno()).split(",");
		issuesService.saveIssues(issues);
		int lastInsertIno = issuesService.getLastIno();
		issueLabel.setIno(lastInsertIno);
		if (lnos != null && lnos.length > 0) {
			for (int i = 0; i < lnos.length; i++) {
				issueLabel.setLno(Integer.parseInt(lnos[i]));
				issuesService.saveIssueLabel(issueLabel);
			}
		}
		
		return "redirect:/" + uno + "/" + pno + "/issues/open";
	}

	// issue 수정 페이지
	@RequestMapping(value = "/issues/edit/{uno}/{pno}/{ino}", method = RequestMethod.GET)
	public String editFormIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("ino") int ino, @ModelAttribute("issues") Issue issues, Model model) {
		issues = issuesService.getIssuesByIno(ino);
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> labelList = issuesService.getAllLabel();
		List<Milestone> milestoneList = issuesService.getAllMilestone();
		logger.info("---------------update page------------------");
		logger.info("ino : " + issues.getIno());
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());
		logger.info("weight : " + issues.getIweight());

		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("issues", issues);
		model.addAttribute("userList", userList);
		model.addAttribute("labelList", labelList);
		model.addAttribute("milestoneList", milestoneList);

		return "/issues/editIssue";
	}

	// issue 수정
	@RequestMapping(value = "/issues/edit", method = RequestMethod.POST)
	public String editIssue(int uno, int pno, @ModelAttribute("Issues") Issue issues, BindingResult result) {
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
	
	@RequestMapping("/{uno}/{pno}/issues/{statement}/search")
	public String searchIssueByUno(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("statement") String stat, 
			@RequestParam(value="userNo", required=false) Integer userNo,
			@RequestParam(value="mno", required=false) Integer mno,
			@RequestParam(value="lno", required=false) Integer lno,
			@RequestParam(value="weight", required=false) Integer weight, Model model) {
		logger.info("userNo : " + userNo);
		logger.info("mno : " + mno);
		logger.info("lno : " + lno);
		logger.info("weight : " + weight);
		Map<String, Object> param = new HashMap<String, Object>();
		List<Issue> issuesList = new ArrayList<Issue>();
		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> allMilestoneList = issuesService.getAllMilestone();
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("istatement", "000");
			param.put("userNo", userNo);
			param.put("mno", mno);
			param.put("lno", lno);
			param.put("weight", weight);
			issuesList = issuesService.searchIssues(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("istatement", "001");
			param.put("userNo", userNo);
			param.put("mno", mno);
			param.put("lno", lno);
			param.put("weight", weight);
			issuesList = issuesService.searchIssues(param);
			System.out.println(issuesList.size());
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else {
			param.put("pno", pno);
			param.put("userNo", userNo);
			param.put("mno", mno);
			param.put("lno", lno);
			param.put("weight", weight);
			issuesList = issuesService.searchIssues(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		}
		
		model.addAttribute("stat", stat);
		model.addAttribute("searchUno", userNo);
		model.addAttribute("issuesList", issuesList);
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("allMilestoneList", allMilestoneList);
		
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
