package com.nbreds.projectPlanning.issues.Controller;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.common.util.DateCalculator;
import com.nbreds.projectPlanning.issues.Service.IssueService;
import com.nbreds.projectPlanning.issues.VO.Comment;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.issues.VO.Label;
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
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> milestoneList = issuesService.getMilestoneByPno(pno);
		List<User> userList = issuesService.getUserListByPno(pno);
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 현재 날짜 구하기
		long today = 0;
		try {
			today = DateCalculator.getInstance().getToday();
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		logger.info("today : " + today);
		
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("uno", uno);
			param.put("istatement", "000");
			issuesList = issuesService.getIssuesByPno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 close and label은 종료로 update
					String iRegdateToString = issuesList.get(i).getIduedate();
					long regDate = 0;
					long timeDifference = 0;
					try {
						regDate = DateCalculator.getInstance().getRegDate(iRegdateToString);
						timeDifference = DateCalculator.getInstance().getTimeDifference(regDate, today);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					logger.info("timeDifference : " + timeDifference);
					
					if (timeDifference < 0) {
						Map<String, Object> param3 = new HashMap<String, Object>();
						param3.put("istatement", "001");
						param3.put("ino", issuesList.get(i).getIno());
						param3.put("lno", 5);
						issuesService.closeIssue(param3);
					}
					
					/************************************************************************/
					
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
			issuesList = issuesService.getIssuesByPno(param);
		} else if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("uno", uno);
			param.put("istatement", "001");
			issuesList = issuesService.getIssuesByPno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		} else {
			param.put("pno", pno);
			param.put("uno", uno);
			issuesList = issuesService.getIssuesByPno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		}
		
		int issueOpenCnt = 0;
		int issueClosedCnt = 0;
		for (int i = 0; i < 2; i++) {
			Map<String, Object> param2 = new HashMap<String, Object>();
			param2.put("pno", pno);
			if (i == 0) {
				param2.put("istatement", "000");
				issueOpenCnt = issuesService.getIssueCnt(param2);
				logger.info("issueOepnCnt : " + issueOpenCnt);
			} else {
				param2.put("istatement", "001");
				issueClosedCnt = issuesService.getIssueCnt(param2);
				logger.info("issueClosedCnt : " + issueClosedCnt);
			}
		}
		int issueAllCnt = issueOpenCnt + issueClosedCnt;
		logger.info("issueAllCnt : " + issueAllCnt);
		
		String pname = issuesService.getPnameByPno(pno);
		
		if (issuesList.isEmpty()) {
			model.addAttribute("issuesList", "none");
		} else {
			model.addAttribute("issuesList", issuesList);
		}
		model.addAttribute("pname", pname);
		model.addAttribute("stat", stat);
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("milestoneList", milestoneList);
		model.addAttribute("issueOpenCnt", issueOpenCnt);
		model.addAttribute("issueClosedCnt", issueClosedCnt);
		model.addAttribute("issueAllCnt", issueAllCnt);

		return "/Project/myProjects/Issues/issues";
	}

	// ino로 특정 issue 정보 불러오기
	@RequestMapping("/{uno}/{pno}/issue/{ino}")
	public String detailIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino,
			Model model) {
		Issue issues = issuesService.getIssuesByIno(ino);
		
		// ino로 파일 리스트 불러오기
		List<Files> fileList = issuesService.getFileListByIno(ino);

		model.addAttribute("issues", issues);
		model.addAttribute("fileList", fileList);

		return "issues/detailIssue";
	}

	// fno로 파일 정보 불러와서 다운로드 하기
	@RequestMapping("/issue/downloadFile/{fno}")
	public void downloadFile(@PathVariable("fno") int fno, HttpServletResponse response) {
		Files fileInfo = issuesService.getFileInfoByFno(fno);

		try {
			byte fileByte[] = FileUtils.readFileToByteArray(new File("/home/projectPlan/WebProject/upload/" + fileInfo.getStoreName()));

			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",
					"attachment; fileName=\"" + URLEncoder.encode(fileInfo.getOriginalName(), "UTF-8") + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.getOutputStream().write(fileByte);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				response.getOutputStream().flush();
				response.getOutputStream().close();
			} catch(Exception e) {}
		}
	}

	// issues 등록 폼으로
	@RequestMapping("/{uno}/{pno}/issues/new")
	public String newIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, HttpServletRequest request, Model model) {
		List<Label> labels = issuesService.getAllLabel();
		List<User> userList = issuesService.getUserListByPno(pno);
		List<User> allUserList = issuesService.getAllUserNameAndNo();
		List<Milestone> milestoneList = issuesService.getMilestoneByPno(pno);
		String mno = request.getParameter("mno");
		String mtitle = request.getParameter("mtitle");
		if (mno != null && mtitle != null) {
			logger.info("mno : " + mno);
			logger.info("mtitle : " + mtitle);
			model.addAttribute("mno", mno);
			model.addAttribute("mtitle", mtitle);
		}
		
		if (userList.isEmpty()) {
			model.addAttribute("userList", "none");
		} else {
			model.addAttribute("userList", userList);
		}
		if (milestoneList.isEmpty()) {
			model.addAttribute("milestoneList", "none");
		} else {
			model.addAttribute("milestoneList", milestoneList);
		}
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("labels", labels);
		model.addAttribute("allUserList", allUserList);

		return "/issues/newIssue";
	}

	// issue 등록 요청
	@RequestMapping("/issues/regist")
	public String registIssue(int uno, int pno, @ModelAttribute("Issues") Issue issues, BindingResult result,
			HttpServletRequest request, HttpSession session) {
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());
		logger.info("pno : " + issues.getPno());
		logger.info("lno : " + issues.getLno());
		
		int loginUserNo = (int) session.getAttribute("user_no");
		logger.info("loginUserNo : " + loginUserNo);
		
		issuesService.saveIssues(issues, request);
		
		// 파일이 view단에서 controller로 잘 넘어오는지 log 찍어봄
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    while(iterator.hasNext()){
	        multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	            logger.info("------------- file start -------------");
	            logger.info("name : "+multipartFile.getName());
	            logger.info("filename : "+multipartFile.getOriginalFilename());
	            logger.info("size : "+multipartFile.getSize());
	            logger.info("-------------- file end --------------\n");
	        }
	    }

		return "redirect:/" + loginUserNo + "/" + pno + "/issues/open";
	}
	
	// issue 수정 페이지
	@RequestMapping(value = "/issues/edit/{uno}/{pno}/{ino}", method = RequestMethod.GET)
	public String editFormIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("ino") int ino, @ModelAttribute("issues") Issue issues, Model model) {
		issues = issuesService.getIssuesByIno(ino);
		List<User> userList = issuesService.getUserListByPno(pno);
		List<User> allUserList = issuesService.getAllUserNameAndNo();
		List<Label> labelList = issuesService.getAllLabel();
		List<Milestone> milestoneList = issuesService.getMilestoneByPno(pno);
		// ino로 파일 리스트 불러오기
		List<Files> fileList = issuesService.getFileListByIno(ino);
		logger.info("---------------update page------------------");
		logger.info("ino : " + issues.getIno());
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());

		if (userList.isEmpty()) {
			model.addAttribute("userList", "none");
		} else {
			model.addAttribute("userList", userList);
		}
		if (milestoneList.isEmpty()) {
			model.addAttribute("milestoneList", "none");
		} else {
			model.addAttribute("milestoneList", milestoneList);
		}
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("issues", issues);
		model.addAttribute("allUserList", allUserList);
		model.addAttribute("labelList", labelList);
		model.addAttribute("fileList", fileList);

		return "/issues/editIssue";
	}

	// issue 수정
	@RequestMapping(value = "/issues/edit", method = RequestMethod.POST)
	public String editIssue(@ModelAttribute("Issues") Issue issues, 
			HttpServletRequest request, HttpSession session, BindingResult result) {
		logger.info("---------------updating page------------------");
		logger.info("ino : " + issues.getIno());
		logger.info("title : " + issues.getItitle());
		logger.info("lnos : " + issues.getLno());
		logger.info("uno : " + issues.getUno());
		int loginUserNo = (int) session.getAttribute("user_no");
		
		issuesService.updateIssueByIno(issues, request);
		
		return "redirect:/" + loginUserNo + "/" + issues.getPno() + "/issue/" + issues.getIno();
	}
	
	// issue 리스트창에서 다이렉트로 issue 수정
	@RequestMapping("/issues/directEdit/{uno}/{pno}")
	public String directEditIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			String status, String userNo2, String mno2, String[] cbList) {
		logger.info("status : " + status);
		logger.info("userNo2 : " + userNo2);
		logger.info("mno2 : " + mno2);
		if (cbList.length > 0) {
			for (int i = 0; i < cbList.length; i++) {
				logger.info("cbList[i] : " + cbList[i]);
			}
		}
		
		if(!status.equals("") && cbList.length > 0) {
			if (status.equals("Open")) {
				for (int i = 0; i < cbList.length; i++) {
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("ino", cbList[i]);
					param.put("istatement", "000");
					issuesService.reopenIssue(param);
				}
			} else if (status.equals("Closed")) {
				for (int i = 0; i < cbList.length; i++) {
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("ino", cbList[i]);
					param.put("istatement", "001");
					issuesService.closeIssue(param);
				}
			}
		}
		
		if (!userNo2.equals("") && cbList.length > 0) {
			for (int i = 0; i < cbList.length; i++) {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("ino", cbList[i]);
				param.put("uno", userNo2);
				issuesService.updateAssigneeByIno(param);
			}
		}
		
		if (!mno2.equals("") && cbList.length > 0) {
			for (int i = 0; i < cbList.length; i++) {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("ino", cbList[i]);
				param.put("mno", mno2);
				issuesService.updateMilestoneByIno(param);
			}
		}
		
		
		return "redirect:/" + uno + "/" + pno + "/issues/open";
	}

	// issue close
	@RequestMapping("/issues/close/{uno}/{pno}/{ino}")
	public String closeIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino) {
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> param2 = new HashMap<String, Object>();
		List<Issue> issueList = new ArrayList<Issue>();
		param.put("pno", pno);
		param.put("uno", uno);
		param.put("istatement", "000");
		issueList = issuesService.getIssuesByPno(param);
		
		if (!issueList.isEmpty()) {
			// 현재 날짜 구하기
			long today = 0;
			try {
				today = DateCalculator.getInstance().getToday();
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			logger.info("today : " + today);
			
			for (int i = 0; i < issueList.size(); i++) {
				// 현재 날짜랑 issue iDuedate 날짜랑 비교해서 만기된 issue면 close and label은 종료로 update
				// 만기되지 않은 issue라면 close and label은 중단으로 update
				String iRegdateToString = issueList.get(i).getIduedate();
				long regDate = 0;
				long timeDifference = 0;
				try {
					regDate = DateCalculator.getInstance().getRegDate(iRegdateToString);
					timeDifference = DateCalculator.getInstance().getTimeDifference(regDate, today);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				logger.info("timeDifference : " + timeDifference);
				
				if (timeDifference < 0) {
					param2.put("istatement", "001");
					param2.put("ino", issueList.get(i).getIno());
					param2.put("lno", 5);
					issuesService.closeIssue(param2);
				} else {
					param2.put("istatement", "001");
					param2.put("ino", issueList.get(i).getIno());
					param2.put("lno", 4);
					issuesService.closeIssue(param2);
				}
			}
		}
		
		return "redirect:/" + uno + "/" + pno + "/issues/closed";
	}
	
	// issue reopen
	@RequestMapping("/issues/reopen/{uno}/{pno}/{ino}")
	public String reopenIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ino", ino);
		param.put("istatement", "000");
		issuesService.reopenIssue(param);
		return "redirect:/" + uno + "/" + pno + "/issues/open";
	}

	@RequestMapping("/{uno}/{pno}/issues/{statement}/search")
	public String searchIssueByUno(@PathVariable("uno") int uno, @PathVariable("pno") int pno,
			@PathVariable("statement") String stat, @RequestParam(value = "userNo", required = false) Integer userNo,
			@RequestParam(value = "mno", required = false) Integer mno,
			@RequestParam(value = "lno", required = false) Integer lno, Model model) {
		logger.info("userNo : " + userNo);
		logger.info("mno : " + mno);
		logger.info("lno : " + lno);
		Map<String, Object> param = new HashMap<String, Object>();
		List<Issue> issuesList = new ArrayList<Issue>();
//		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getUserListByPno(pno);
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> milestoneList = issuesService.getMilestoneByPno(pno);
		logger.info("milestoneList : " + milestoneList.size());
		String selectedUserName = "";
		String selectedMilestone = "";
		String selectedLabelName = "";
		if (stat.equals("open")) {
			param.put("pno", pno);
			param.put("istatement", "000");
			param.put("userNo", userNo);
			param.put("mno", mno);
			param.put("lno", lno);
//			param.put("weight", weight);
			issuesList = issuesService.searchIssues(param);
//			for (int i = 0; i < issuesList.size(); i++) {
//				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
//				issuesList.get(i).setLabels(labelList);
//			}
		}
		if (stat.equals("closed")) {
			param.put("pno", pno);
			param.put("istatement", "001");
			param.put("userNo", userNo);
			param.put("mno", mno);
			param.put("lno", lno);
//			param.put("weight", weight);
			issuesList = issuesService.searchIssues(param);
			System.out.println(issuesList.size());
//			for (int i = 0; i < issuesList.size(); i++) {
//				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
//				issuesList.get(i).setLabels(labelList);
//			}
		} else {
			param.put("pno", pno);
			param.put("userNo", userNo);
			param.put("mno", mno);
			param.put("lno", lno);
//			param.put("weight", weight);
			issuesList = issuesService.searchIssues(param);
//			for (int i = 0; i < issuesList.size(); i++) {
//				labelList = issuesService.getLabelsByIno(issuesList.get(i).getIno());
//				issuesList.get(i).setLabels(labelList);
//			}
		}
		
		if (userList != null && userList.size() > 0) {
			for (int i = 0; i < userList.size(); i++) {
				if (userNo != null) {
					if (userNo.equals(userList.get(i).getUno())) {
						selectedUserName = userList.get(i).getUname();
					}
				}
			}
		}
		
		if (milestoneList != null && milestoneList.size() > 0) {
			for (int i = 0; i < milestoneList.size(); i++) {
				if (mno != null) {
					if (mno.equals(milestoneList.get(i).getMno())) {
						selectedMilestone = milestoneList.get(i).getMtitle();
					}
				}
			}
		}
		
		if (allLabelList != null && allLabelList.size() > 0) {
			for (int i = 0; i < allLabelList.size(); i++) {
				if (lno != null) {
					if (lno.equals(allLabelList.get(i).getLno())) {
						selectedLabelName = allLabelList.get(i).getLtitle();
					}
				}
			}
		}

		model.addAttribute("stat", stat);
		model.addAttribute("searchUno", userNo);
		model.addAttribute("mno", mno);
		model.addAttribute("lno", lno);
		if (issuesList.isEmpty()) {
			model.addAttribute("issuesList", "none");
		} else {
			model.addAttribute("issuesList", issuesList);
		}
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("milestoneList", milestoneList);
		model.addAttribute("selectedUserName", selectedUserName);
		model.addAttribute("selectedMilestone", selectedMilestone);
		model.addAttribute("selectedLabelName", selectedLabelName);

		return "/Project/myProjects/Issues/issues";
	}

	// dash board 외부 issue
	@RequestMapping(value = "/issues/{statement}", method = RequestMethod.GET)
	public String home(@PathVariable("statement") String stat, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no")); // 세션의 uno
		List<Issue> issuesList = new ArrayList<Issue>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> allMilestoneList = issuesService.getAllMilestone();
		List<Issue> projectInfoByUno = new ArrayList<Issue>();
		HashMap<String, Object> param = new HashMap<>();
		String userName = "";
		
		if (stat.equals("open")) {
			param.put("uno", uno);
			param.put("istatement", "000");
			issuesList = issuesService.getIssuesByUno(param);
			projectInfoByUno = issuesService.getProjectInfoByUno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		} else if (stat.equals("closed")) {
			param.put("uno", uno);
			param.put("istatement", "001");
			issuesList = issuesService.getIssuesByUno(param);
			projectInfoByUno = issuesService.getProjectInfoByUno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		} else {
			param.put("uno", uno);
			issuesList = issuesService.getIssuesByUno(param);
			projectInfoByUno = issuesService.getProjectInfoByUno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		}
		
		if (userList.size() > 0) {
			for (int i = 0; i < userList.size(); i++) {
				if (uno.equals(String.valueOf(userList.get(i).getUno()))) {
					userName = userList.get(i).getUname();
				}
			}
		}
		logger.info("userName : " + userName);
		
		model.addAttribute("stat", stat);
		if (issuesList.isEmpty()) {
			model.addAttribute("issuesList", "none");
		} else {
			model.addAttribute("projectInfo", projectInfoByUno);
			model.addAttribute("issuesList", issuesList);
		}
		model.addAttribute("userName", userName);
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("milestoneList", allMilestoneList);

		return "issues/issues";
	}

	@RequestMapping("/issues/{statement}/search")
	public String searchIssueByUno(@PathVariable("statement") String stat,
			@RequestParam(value = "uno", required = false) Integer uno,
			@RequestParam(value = "mno", required = false) Integer mno,
			@RequestParam(value = "lno", required = false) Integer lno, Model model, HttpSession session) {
		logger.info("uno : " + uno);
		logger.info("mno : " + mno);
		logger.info("lno : " + lno);
		String userNo = String.valueOf(session.getAttribute("user_no"));
		Map<String, Object> param = new HashMap<String, Object>();
		List<Issue> issuesList = new ArrayList<Issue>();
		List<Issue> projectInfoByUno = new ArrayList<Issue>();
//		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> milestoneList = issuesService.getAllMilestone();
		String selectedUserName = "";
		String selectedMilestone = "";
		String selectedLabelName = "";
		if (stat.equals("open")) {
			param.put("istatement", "000");
			param.put("uno", uno);
			param.put("mno", mno);
			param.put("lno", lno);
			issuesList = issuesService.searchIssuesByParam(param);
			projectInfoByUno = issuesService.getProjectInfoByUno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		}
		if (stat.equals("closed")) {
			param.put("istatement", "001");
			param.put("uno", uno);
			param.put("mno", mno);
			param.put("lno", lno);
			issuesList = issuesService.searchIssuesByParam(param);
			projectInfoByUno = issuesService.getProjectInfoByUno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		} else {
			param.put("uno", uno);
			param.put("mno", mno);
			param.put("lno", lno);
			issuesList = issuesService.searchIssuesByParam(param);
			projectInfoByUno = issuesService.getProjectInfoByUno(param);
			if (!issuesList.isEmpty()) {
				for (int i = 0; i < issuesList.size(); i++) {
					int commentCnt = issuesService.getCommentCnt(issuesList.get(i).getIno());
					issuesList.get(i).setCommentCnt(commentCnt);
				}
			}
		}
		
		if (userList != null && userList.size() > 0) {
			for (int i = 0; i < userList.size(); i++) {
				if (uno != null) {
					if (uno.equals(userList.get(i).getUno())) {
						selectedUserName = userList.get(i).getUname();
					}
				}
			}
		}
		
		if (milestoneList != null && milestoneList.size() > 0) {
			for (int i = 0; i < milestoneList.size(); i++) {
				if (mno != null) {
					if (mno.equals(milestoneList.get(i).getMno())) {
						selectedMilestone = milestoneList.get(i).getMtitle();
					}
				}
			}
		}
		
		if (allLabelList != null && allLabelList.size() > 0) {
			for (int i = 0; i < allLabelList.size(); i++) {
				if (lno != null) {
					if (lno.equals(allLabelList.get(i).getLno())) {
						selectedLabelName = allLabelList.get(i).getLtitle();
					}
				}
			}
		}

		model.addAttribute("stat", stat);
		model.addAttribute("uno", uno);
		model.addAttribute("mno", mno);
		model.addAttribute("lno", lno);
		if (issuesList.isEmpty()) {
			model.addAttribute("issuesList", "none");
		} else {
			model.addAttribute("projectInfo", projectInfoByUno);
			model.addAttribute("issuesList", issuesList);
		}
		model.addAttribute("userList", userList);
		model.addAttribute("allLabelList", allLabelList);
		model.addAttribute("milestoneList", milestoneList);
		model.addAttribute("selectedUserName", selectedUserName);
		model.addAttribute("selectedMilestone", selectedMilestone);
		model.addAttribute("selectedLabelName", selectedLabelName);

		return "/issues/issues";
	}

	// 코멘트 리스트 ajax 통신
	@RequestMapping("/getCommentList/{ino}")
	public String getCommentList(@PathVariable("ino") int ino, Model model) {
		List<Comment> commentList = issuesService.getCommentByIno(ino);
		model.addAttribute("commentList", commentList);
		
		return "/issues/commentIssue";
	}

	// 코멘트 등록
	@RequestMapping(value = "/comment/regist", method = RequestMethod.POST)
	public void saveComment(HttpServletRequest request, Writer writer) throws IOException {
		Map<String, Object> param = new HashMap<String, Object>();
		String userNo = request.getParameter("uno");
		String ino = request.getParameter("ino");
		String content = request.getParameter("content");
		param.put("uno", userNo);
		param.put("ino", ino);
		param.put("content", content);
		issuesService.saveComment(param);
		writer.write("end");
	}

	// 코멘트 삭제
	@RequestMapping(value = "/remove/comment", method = RequestMethod.POST)
	public void removeComment(HttpServletRequest request, Writer writer) throws IOException {
		String cno = request.getParameter("cno");
		issuesService.removeCommentByCno(Integer.parseInt(cno));
		writer.write("end");
	}

	// 코멘트 수정
	@RequestMapping(value = "/update/comment", method = RequestMethod.POST)
	public void updateComment(HttpServletRequest request, Writer writer) throws IOException {
		Map<String, Object> param = new HashMap<String, Object>();
		String content = request.getParameter("content2");
		String cno = request.getParameter("cno");
		logger.info("content : " + content);
		logger.info("cno : " + cno);
		param.put("content", content);
		param.put("cno", cno);
		issuesService.updateComment(param);
		writer.write("end");
	}
	
	//이슈삭제
	@RequestMapping("/issues/remove/{uno}/{pno}/{ino}")
	public String removeIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino) {
		issuesService.removeIssues(ino);
		
		return "redirect:/" + uno + "/" + pno + "/issues/open";
	}
}
