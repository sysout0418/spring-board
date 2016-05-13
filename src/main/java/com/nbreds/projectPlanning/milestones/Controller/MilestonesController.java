package com.nbreds.projectPlanning.milestones.Controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.common.util.DateCalculator;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.Service.MilestonesService;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Controller
public class MilestonesController {
	private static final Logger logger = LoggerFactory.getLogger(MilestonesController.class);

	@Autowired
	MilestonesService milestonesService;

	@RequestMapping(value = "/milestones/{statement}", method = RequestMethod.GET)
	public String home(@PathVariable("statement") String stat, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no")); // 세션의 uno
		List<Milestone> list;
		HashMap<String, Object> param = new HashMap<>();
		Map<String, Object> param2 = new HashMap<String, Object>();
		if (stat.equals("open")) {
			param.put("uno", uno);
			param.put("mstatement", "000");
			list = milestonesService.getJoinMilestones(param);
			if (!list.isEmpty()) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 expired
				param2.put("targetList", list);
				DateCalculator.getInstance().setExpired(param2);
			}
		} else if (stat.equals("closed")) {
			param.put("uno", uno);
			param.put("mstatement", "001");
			list = milestonesService.getJoinMilestones(param);
			if (!list.isEmpty()) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 expired
				param2.put("targetList", list);
				DateCalculator.getInstance().setExpired(param2);
			}
		} else {
			param.put("uno", uno);
			list = milestonesService.getJoinMilestones(param);
			if (!list.isEmpty()) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 expired
				param2.put("targetList", list);
				DateCalculator.getInstance().setExpired(param2);
			}
		}
		for (Milestone milestone : list) {
			int countIssues = milestonesService.countIssuesByMno(milestone.getMno());
			double completeIssuePercent = milestonesService.countClosedIssueByMno(milestone.getMno());
			milestone.setCountIssues(countIssues);
			milestone.setCompleteIssuePercent((int) Math.round((completeIssuePercent / countIssues) * 100));
		}
		
		model.addAttribute("stat", stat);
		if(list.size() > 0)	model.addAttribute("list", list);
		else model.addAttribute("list", "none");

		return "milestones/milestones";
	}

	@RequestMapping("/{uno}/{pno}/milestones/{statement}")
	public String milestones(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("statement") String stat, Model model) {
		List<Milestone> list;
		HashMap<String, Object> param = new HashMap<>();
		Map<String, Object> param2 = new HashMap<String, Object>();
		Map<String, Object> param3 = new HashMap<String, Object>();
		
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("mstatement", "000");
			list = milestonesService.getMilestonesByPno(param);
			if (!list.isEmpty()) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 expired
				param2.put("targetList", list);
				DateCalculator.getInstance().setExpired(param2);
			}
		} else if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("mstatement", "001");
			list = milestonesService.getMilestonesByPno(param);
			if (!list.isEmpty()) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 expired
				param2.put("targetList", list);
				DateCalculator.getInstance().setExpired(param2);
			}
		} else {
			param.put("pno", pno);
			list = milestonesService.getMilestonesByPno(param);
			if (!list.isEmpty()) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 expired
				param2.put("targetList", list);
				DateCalculator.getInstance().setExpired(param2);
			}
		}
		
		int milestoneOpenCnt = 0;
		int milestoneClosedCnt = 0;
		for (int i = 0; i < 2; i++) {
			param3.put("pno", pno);
			if (i == 0) {
				param3.put("mstatement", "000");
				milestoneOpenCnt = milestonesService.getMilestoneCnt(param3);
				logger.info("milestoneOpenCnt : " + milestoneOpenCnt);
			} else {
				param3.put("mstatement", "001");
				milestoneClosedCnt = milestonesService.getMilestoneCnt(param3);
				logger.info("milestoneClosedCnt : " + milestoneClosedCnt);
			}
		}
		int milestoneAllCnt = milestoneOpenCnt + milestoneClosedCnt;
		logger.info("issueAllCnt : " + milestoneAllCnt);
		
		for (Milestone milestone : list) {
			int countIssues = milestonesService.countIssuesByMno(milestone.getMno());
			double completeIssuePercent = milestonesService.countClosedIssueByMno(milestone.getMno());
			milestone.setCountIssues(countIssues);
			milestone.setCompleteIssuePercent((int) Math.round((completeIssuePercent / countIssues) * 100));
		}
		String pname = milestonesService.getPnameByPno(pno);
		
		model.addAttribute("stat", stat);
		model.addAttribute("pname", pname);
		model.addAttribute("milestoneOpenCnt", milestoneOpenCnt);
		model.addAttribute("milestoneClosedCnt", milestoneClosedCnt);
		model.addAttribute("milestoneAllCnt", milestoneAllCnt);
		if(list.size() > 0)	model.addAttribute("list", list);
		else model.addAttribute("list", "none");

		return "/Project/myProjects/Milestones/milestones";
	}

	@RequestMapping("/milestone/{mno}")
	public String detailMilestone(@PathVariable("mno") int mno, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no")); // 세션의 uno
		Milestone milestone = milestonesService.getMilestoneBymno(mno);

		int countIssues = milestonesService.countIssuesByMno(mno); // 총 issue갯수
		int countOpenIssues = milestonesService.countOpenIssuesByMno(mno);// open
																			// issue갯수
		double countClosedIssues = milestonesService.countClosedIssueByMno(mno);// closed
																				// issue갯수
		int completeIssuePercent = (int) Math.round((countClosedIssues / countIssues) * 100); // 완료
																								// percentage

		model.addAttribute("uno", uno);
		model.addAttribute("countIssues", countIssues);
		model.addAttribute("countOpenIssues", countOpenIssues);
		model.addAttribute("countClosedIssues", countClosedIssues);
		model.addAttribute("completeIssuePercent", completeIssuePercent);
		model.addAttribute("milestone", milestone);

		return "/milestones/detailMilestone_dash";
	}

	@RequestMapping("/{uno}/{pno}/milestone/{mno}")
	public String detailMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("mno") int mno, Model model) {
		Milestone milestone = milestonesService.getMilestoneBymno(mno);

		int countIssues = milestonesService.countIssuesByMno(mno); // 총 issue갯수
		int countOpenIssues = milestonesService.countOpenIssuesByMno(mno);// open issue갯수
		double countClosedIssues = milestonesService.countClosedIssueByMno(mno);// closed issue갯수
		int completeIssuePercent = (int) Math.round((countClosedIssues / countIssues) * 100); // 완료 percentage

		List<Issue> issues = milestonesService.getIssuesBymno(mno);
		
		// mno로 파일 리스트 불러오기
		List<Files> fileList = milestonesService.getFileListByMno(mno);

		model.addAttribute("countIssues", countIssues);
		model.addAttribute("countOpenIssues", countOpenIssues);
		model.addAttribute("countClosedIssues", countClosedIssues);
		model.addAttribute("completeIssuePercent", completeIssuePercent);
		model.addAttribute("issues", issues);
		model.addAttribute("milestone", milestone);
		model.addAttribute("fileList", fileList);

		return "Project/Milestones/detailMilestone";
	}

	@RequestMapping("/{uno}/{pno}/milestones/new")
	public String newMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model,
			Milestone milestones) {
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);

		return "/milestones/newMilestone";
	}

	@RequestMapping("/milestones/regist")
	public String regist(int uno, int pno, @ModelAttribute("milestones") Milestone milestone, BindingResult result,
			HttpServletRequest request, HttpSession session) {
		logger.info("title : " + milestone.getMtitle());
		logger.info("description : " + milestone.getMdescription());
		logger.info("duedate : " + milestone.getMduedate());
		logger.info("pno : " + milestone.getPno());
		milestone.setUno((int)session.getAttribute("user_no"));
		milestonesService.saveMilestone(milestone, request);

		// 파일이 view단에서 controller로 잘 넘어오는지 log 찍어봄
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				logger.info("------------- file start -------------");
				logger.info("name : " + multipartFile.getName());
				logger.info("filename : " + multipartFile.getOriginalFilename());
				logger.info("size : " + multipartFile.getSize());
				logger.info("-------------- file end --------------\n");
			}
		}
		
		return "redirect:/" + uno + "/" + pno + "/milestones/open";
	}

	@RequestMapping(value = "/milestones/edit/{uno}/{pno}/{mno}", method = RequestMethod.GET)
	public String edit(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno,
			@ModelAttribute("milestones") Milestone milestone, Model model) {
		milestone = milestonesService.getMilestoneBymno(mno);
		// mno로 파일 리스트 불러오기
		List<Files> fileList = milestonesService.getFileListByMno(mno);

		logger.info("---------------edit page------------------");
		logger.info("mno : " + milestone.getMno());
		logger.info("mtitle : " + milestone.getMtitle());
		logger.info("mdescription : " + milestone.getMdescription());
		logger.info("mduedate : " + milestone.getMduedate());

		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("milestones", milestone);
		model.addAttribute("fileList", fileList);

		return "/milestones/editMilestone";
	}

	@RequestMapping(value = "/milestones/edit", method = RequestMethod.POST)
	public String editing(int uno, int pno, @ModelAttribute("milestones") Milestone milestone, BindingResult result,
			HttpServletRequest request) {
		logger.info("---------------editing page------------------");
		logger.info("mno : " + milestone.getMno());
		logger.info("mtitle : " + milestone.getMtitle());
		logger.info("mduedate : " + milestone.getMduedate());

		milestonesService.editMilestoneBymno(milestone, request);

		return "redirect:/" + uno + "/" + pno + "/milestones/open";
	}

	@RequestMapping("/milestones/remove/{uno}/{pno}/{mno}")
	public String remove(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno) {
		milestonesService.removeMilestone(mno);

		return "redirect:/" + uno + "/" + pno + "/milestones/open";
	}

	@RequestMapping("/milestones/closeMilestone/{uno}/{pno}/{mno}")
	public String closeMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("mno") int mno) {
		milestonesService.closeMilestone(mno);

		return "redirect:/" + uno + "/" + pno + "/milestone/" + mno;
	}

	@RequestMapping("/milestones/reopenMilestone/{uno}/{pno}/{mno}")
	public String reopenMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("mno") int mno) {
		milestonesService.reopenMilestone(mno);

		return "redirect:/" + uno + "/" + pno + "/milestone/" + mno;
	}

	@RequestMapping(value = "/milestones/ajax", method = RequestMethod.POST)
	public void ajax(int item, String place, int uno) {
		HashMap<String, Object> param = new HashMap<>();
		if (place.equals("unstarted1")) {
			param.put("ino", item);
			param.put("istatement", "000");
			param.put("uno", 0);
			milestonesService.editIssueByIno(param);
		} else if (place.equals("unstarted2")) {
			param.put("ino", item);
			param.put("istatement", "000");
			param.put("uno", uno);
			milestonesService.editIssueByIno(param);
		} else if (place.equals("completed")) {
			param.put("ino", item);
			param.put("istatement", "001");
			milestonesService.editIssueByIno(param);
		} else {

		}
	}
	
	@RequestMapping(value = "dataLoad", method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> dataLoad(HttpSession session, String startdate, String endDate, String pno){
		List<HashMap<String, Object>> list = null;
		if(pno != null){
			HashMap<String, String> param = new HashMap<>();
			param.put("startdate", startdate);
			param.put("endDate", endDate);
			param.put("pno", pno);
			
			System.out.println(param);
			list = milestonesService.getMilestonesDataByPno(param);
		}
		else{
			String uno = String.valueOf(session.getAttribute("user_no")); // 세션의 uno
			
			//파라미터 생성
			HashMap<String, String> param = new HashMap<>();
			param.put("startdate", startdate);
			param.put("endDate", endDate);
			param.put("uno", uno);
			
			logger.info("param : " + param);
			list = milestonesService.getMilestonesDataByUno(param);
		}
		return list;
	}
}