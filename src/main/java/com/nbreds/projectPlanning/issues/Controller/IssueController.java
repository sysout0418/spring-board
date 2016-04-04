package com.nbreds.projectPlanning.issues.Controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.ArrayList;
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

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.Service.IssueService;
import com.nbreds.projectPlanning.issues.VO.Comment;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.issues.VO.IssueFiles;
import com.nbreds.projectPlanning.label.VO.Label;
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

	// ino로 특정 issue 정보 불러오기
	@RequestMapping("/{uno}/{pno}/issue/{ino}")
	public String detailIssue(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("ino") int ino,
			Model model) {
		Issue issues = issuesService.getIssuesByIno(ino);
		List<Label> labelList = issuesService.getLabelsByIno(ino);
		issues.setLabels(labelList);

		// ino로 파일 리스트 불러오기
		List<IssueFiles> fileList = issuesService.getFileListByIno(ino);

		model.addAttribute("issues", issues);
		model.addAttribute("fileList", fileList);

		return "issues/detailIssue";
	}

	// fno로 파일 정보 불러와서 다운로드 하기
	@RequestMapping("/issue/downloadFile/{fno}")
	public void downloadFile(@PathVariable("fno") int fno, HttpServletResponse response) {
		IssueFiles fileInfo = issuesService.getFileInfoByFno(fno);

		try {
			byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\IssueFiles\\" + fileInfo.getStoreName()));

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
	public String registIssue(int uno, int pno, @ModelAttribute("Issues") Issue issues, BindingResult result,
			HttpServletRequest request) {
		logger.info("title : " + issues.getItitle());
		logger.info("description : " + issues.getIdescription());
		logger.info("weight : " + issues.getIweight());
		logger.info("pno : " + issues.getPno());
		logger.info("lno : " + issues.getLno());
		String[] lnos = String.valueOf(issues.getLno()).split(",");
		logger.info("lno[0] : " + lnos[0]);
		issuesService.saveIssues(issues, request);
		int lastInsertIno = issuesService.getLastIno();
		logger.info("ino : " + String.valueOf(lastInsertIno));
		IssueLabel issueLabel = new IssueLabel();
		issueLabel.setIno(lastInsertIno);
		if (lnos != null && lnos.length > 0 && !lnos[0].equals("0")) {
			for (int i = 0; i < lnos.length; i++) {
				issueLabel.setLno(Integer.parseInt(lnos[i]));
				issuesService.saveIssueLabel(issueLabel);
			}
		}

		// 파일이 서버에 제대로 전송 되는지 확인
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
		List<Issue> issueList = new ArrayList<Issue>();
		List<Label> labelList = new ArrayList<Label>();
		List<User> userList = issuesService.getAllUserNameAndNo();
		List<Label> allLabelList = issuesService.getAllLabel();
		List<Milestone> allMilestoneList = issuesService.getAllMilestone();
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

	@RequestMapping("/issues/{statement}/search")
	public String searchIssueByUno(@PathVariable("statement") String stat,
			@RequestParam(value = "uno", required = false) Integer uno,
			@RequestParam(value = "mno", required = false) Integer mno,
			@RequestParam(value = "lno", required = false) Integer lno,
			@RequestParam(value = "weight", required = false) Integer weight, Model model) {
		logger.info("uno : " + uno);
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
		}
		if (stat.equals("closed")) {
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
		// return "redirect:/" + uno + "/" + pno + "/issue/" + ino;
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
}
