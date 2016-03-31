package com.nbreds.projectPlanning.issues.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.Service.IssuesService;
import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Controller
public class IssuesController {
	private static final Logger logger = LoggerFactory.getLogger(IssuesController.class);

	@Autowired
	IssuesService issuesService;

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
		List<Issues> issuesList = new ArrayList<Issues>();
		List<Label> labelList = new ArrayList<Label>();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestones> allMilestoneList = issuesService.getAllMilestone();
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

	// @RequestMapping(value = "/{uno}/{pno}/issues/{statement}", method =
	// RequestMethod.GET)
	// public String searchIssue(@PathVariable("uno") int uno,
	// @PathVariable("pno") int pno,
	// @PathVariable("statement") String stat, @RequestParam("userNo") int
	// userNo,
	// @RequestParam("mno") int mno, @RequestParam("lno") int lno,
	// @RequestParam("weight") int weight, Model model) {
	// System.out.println(userNo);
	// return "";
	// }

	// ino로 특정 issue 정보 불러오기
	@RequestMapping("/{uno}/{pno}/issue/{ino}")
	public String detailIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino,
			Model model) {
		Issues issues = issuesService.getIssuesByIno(ino);
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
		List<Milestones> allMilestoneList = issuesService.getAllMilestone();
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("labels", labels);
		model.addAttribute("userList", userList);
		model.addAttribute("allMilestoneList", allMilestoneList);

		return "/issues/newIssue";
	}

	// issue 등록 요청
	@RequestMapping("/issues/regist")
	public String registIssue(int uno, int pno, @ModelAttribute("Issues") Issues issues,
			@ModelAttribute("Issues2") IssueLabel issueLabel, BindingResult result) {
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
			@PathVariable("ino") int ino, Model model) {
		Issues issues = issuesService.getIssuesByIno(ino);
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> labelList = issuesService.getAllLabel();
		List<Milestones> milestoneList = issuesService.getAllMilestone();
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
	public String editIssue(int uno, int pno, @ModelAttribute("Issues") Issues issues, BindingResult result) {
		logger.info("---------------updating page------------------");
		logger.info("ino : " + issues.getIno());
		logger.info("title : " + issues.getItitle());
		logger.info("weight : " + issues.getIweight());
		logger.info("lno : " + issues.getLno());

		IssueLabel issueLabel = new IssueLabel();
		issuesService.updateIssueByIno(issues);
		issuesService.removeIssueLabelForUpdate(issues);
		String[] lnos = String.valueOf(issues.getLno()).split(",");
		logger.info("lnos : " + lnos);
		if (lnos != null && lnos.length > 0 && !lnos[0].equals("")) {
			for (int i = 0; i < lnos.length; i++) {
				issueLabel.setIno(issues.getIno());
				issueLabel.setLno(Integer.parseInt(lnos[i]));
				issuesService.saveIssueLabel(issueLabel);
			}
		}

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
	public String searchIssueByUno(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("statement") String stat, @RequestParam(value = "userNo", required = false) Integer userNo,
			@RequestParam(value = "mno", required = false) Integer mno,
			@RequestParam(value = "lno", required = false) Integer lno,
			@RequestParam(value = "weight", required = false) Integer weight, Model model) {
		logger.info("userNo : " + userNo);
		logger.info("mno : " + mno);
		logger.info("lno : " + lno);
		logger.info("weight : " + weight);
		Map<String, Object> param = new HashMap<String, Object>();
		List<Issues> issuesList = new ArrayList<Issues>();
		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestones> allMilestoneList = issuesService.getAllMilestone();
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
		}
		if (stat.equals("closed")) {
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

	// dash board 외부 issue
	@RequestMapping(value = "/issues/{statement}", method = RequestMethod.GET)
	public String home(@PathVariable("statement") String stat, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no")); // 세션의 uno
		List<Issues> issueList = new ArrayList<Issues>();
		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestones> allMilestoneList = issuesService.getAllMilestone();
		HashMap<String, Object> param = new HashMap<>();
		if (stat.equals("open")) {
			param.put("uno", uno);
			param.put("istatement", "000");
			issueList = issuesService.getIssuesByUno(param);
			for (int i = 0; i < issueList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issueList.get(i).getIno());
				issueList.get(i).setLabels(labelList);
			}
		} else if (stat.equals("closed")) {
			param.put("uno", uno);
			param.put("istatement", "001");
			issueList = issuesService.getIssuesByUno(param);
			for (int i = 0; i < issueList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issueList.get(i).getIno());
				issueList.get(i).setLabels(labelList);
			}
		} else {
			param.put("uno", uno);
			issueList = issuesService.getIssuesByUno(param);
			for (int i = 0; i < issueList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issueList.get(i).getIno());
				issueList.get(i).setLabels(labelList);
			}
		}

		model.addAttribute("stat", stat);
		model.addAttribute("issuesList", issueList);
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("allMilestoneList", allMilestoneList);

		return "issues/issues";
	}

	@RequestMapping("/issues/new")
	public String newIssue2(Model model) {
		List<Label> labels = issuesService.getAllLabel();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Milestones> allMilestoneList = issuesService.getAllMilestone();
		// model.addAttribute("uno", uno);
		// model.addAttribute("pno", pno);
		model.addAttribute("labels", labels);
		model.addAttribute("userList", userList);
		model.addAttribute("allMilestoneList", allMilestoneList);

		return "/issues/newIssue";
	}

	@RequestMapping("/issues/{statement}/search")
	public String searchIssueByParam(@PathVariable("statement") String stat,
			@RequestParam(value = "uno", required = false) Integer uno,
			@RequestParam(value = "mno", required = false) Integer mno,
			@RequestParam(value = "lno", required = false) Integer lno,
			@RequestParam(value = "weight", required = false) Integer weight, Model model) {
		logger.info("uno : " + uno);
		logger.info("mno : " + mno);
		logger.info("lno : " + lno);
		logger.info("weight : " + weight);
		Map<String, Object> param = new HashMap<String, Object>();
		List<Issues> issuesList = new ArrayList<Issues>();
		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestones> allMilestoneList = issuesService.getAllMilestone();
		if (stat.equals("open")) {
			// param.put("pno", pno);
			param.put("istatement", "000");
			param.put("uno", uno);
			param.put("mno", mno);
			param.put("lno", lno);
			param.put("weight", weight);
			issuesList = issuesService.searchIssuesByParam(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else if (stat.equals("closed")) {
			// param.put("pno", pno);
			param.put("istatement", "001");
			param.put("uno", uno);
			param.put("mno", mno);
			param.put("lno", lno);
			param.put("weight", weight);
			issuesList = issuesService.searchIssuesByParam(param);
			System.out.println(issuesList.size());
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		} else {
			// param.put("pno", pno);
			param.put("uno", uno);
			param.put("mno", mno);
			param.put("lno", lno);
			param.put("weight", weight);
			issuesList = issuesService.searchIssuesByParam(param);
			for (int i = 0; i < issuesList.size(); i++) {
				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
				issuesList.get(i).setLabels(labelList);
			}
		}
		model.addAttribute("stat", stat);
		model.addAttribute("uno", uno);
		model.addAttribute("issuesList", issuesList);
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("allMilestoneList", allMilestoneList);

		return "/issues/issues";
	}

}
