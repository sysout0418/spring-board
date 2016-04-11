package com.nbreds.projectPlanning.milestones.Controller;

import java.util.HashMap;
import java.util.HashSet;
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

import com.nbreds.projectPlanning.common.VO.Files;
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
		String uno = String.valueOf(session.getAttribute("user_no")); //세션의 uno
		List<Milestone> list;
		HashMap<String, Object> param = new HashMap<>();
		if(stat.equals("open")){
			param.put("uno", uno);
			param.put("mstatement", "000");
			list = milestonesService.getJoinMilestones(param);
		}
		else if(stat.equals("closed")){
			param.put("uno", uno);
			param.put("mstatement", "001");
			list = milestonesService.getJoinMilestones(param);
		}
		else{
			param.put("uno", uno);
			list = milestonesService.getJoinMilestones(param);
		}
		for (Milestone milestone : list) {
			int countIssues = milestonesService.countIssuesByMno(milestone.getMno());
			double completeIssuePercent = milestonesService.countClosedIssueByMno(milestone.getMno());
			milestone.setCountIssues(countIssues);
			milestone.setCompleteIssuePercent((int)Math.round((completeIssuePercent / countIssues) *100));	
		}
		
		model.addAttribute("stat", stat);
		model.addAttribute("list", list);
		
        return "milestones/milestones";
	}
	
	@RequestMapping("/{uno}/{pno}/milestones/{statement}")
	public String  milestones(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("statement") String stat, Model model) {
		List<Milestone> list;
		HashMap<String, Object> param = new HashMap<>();
		if(stat.equals("open")){
			param.put("pno", pno);
			param.put("mstatement", "000");
			list = milestonesService.getMilestonesByPno(param);
		}
		else if(stat.equals("closed")){
			param.put("pno", pno);
			param.put("mstatement", "001");
			list = milestonesService.getMilestonesByPno(param);
		}
		else{
			param.put("pno", pno);
			list = milestonesService.getMilestonesByPno(param);
		}
		for (Milestone milestone : list) {
			int countIssues = milestonesService.countIssuesByMno(milestone.getMno());
			double completeIssuePercent = milestonesService.countClosedIssueByMno(milestone.getMno());
			milestone.setCountIssues(countIssues);
			milestone.setCompleteIssuePercent((int)Math.round((completeIssuePercent / countIssues) *100));
		}
		
		model.addAttribute("stat", stat);
		model.addAttribute("list", list);
		
		return "/Project/myProjects/Milestones/milestones";
	}
	
	@RequestMapping("/milestone/{mno}")
	public String  detailMilestone(@PathVariable("mno") int mno, Model model, HttpSession session){
		String uno = String.valueOf(session.getAttribute("user_no")); //세션의 uno
		Milestone milestone = milestonesService.getMilestoneBymno(mno);
		
		int countIssues = milestonesService.countIssuesByMno(mno); //총 issue갯수
		int countOpenIssues = milestonesService.countOpenIssuesByMno(mno);//open issue갯수
		double countClosedIssues = milestonesService.countClosedIssueByMno(mno);//closed issue갯수
		int completeIssuePercent = (int) Math.round((countClosedIssues / countIssues) *100); //완료 percentage
		
		List<Issue> issues = milestonesService.getIssuesBymno(mno);
		HashSet<String> uname = new HashSet<>();
		for (Issue issue : issues) {
			String param = String.valueOf(issue.getUno());
			uname.add(milestonesService.getUnameByUno(param));
		}
		
		model.addAttribute("uno", uno);
		model.addAttribute("countIssues", countIssues);
		model.addAttribute("countOpenIssues", countOpenIssues);
		model.addAttribute("countClosedIssues", countClosedIssues);
		model.addAttribute("completeIssuePercent", completeIssuePercent);
		model.addAttribute("issues", issues);
		model.addAttribute("unameSize", uname.size());
		model.addAttribute("uname", uname);
		model.addAttribute("milestone", milestone);
		
		return "/milestones/detailMilestone_dash";
	}
	
	@RequestMapping("/{uno}/{pno}/milestone/{mno}")
	public String detailMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno, Model model) {
		Milestone milestone = milestonesService.getMilestoneBymno(mno);
		
		int countIssues = milestonesService.countIssuesByMno(mno); //총 issue갯수
		int countOpenIssues = milestonesService.countOpenIssuesByMno(mno);//open issue갯수
		double countClosedIssues = milestonesService.countClosedIssueByMno(mno);//closed issue갯수
		int completeIssuePercent = (int) Math.round((countClosedIssues / countIssues) *100); //완료 percentage
		
		List<Issue> issues = milestonesService.getIssuesBymno(mno);
		HashSet<String> uname = new HashSet<>();
		for (Issue issue : issues) {
			if(issue.getUno() != 0){
				String param = String.valueOf(issue.getUno());
				uname.add(milestonesService.getUnameByUno(param));
			}
		}
		// mno로 파일 리스트 불러오기
		List<Files> fileList = milestonesService.getFileListByMno(mno);
				
		model.addAttribute("countIssues", countIssues);
		model.addAttribute("countOpenIssues", countOpenIssues);
		model.addAttribute("countClosedIssues", countClosedIssues);
		model.addAttribute("completeIssuePercent", completeIssuePercent);
		model.addAttribute("issues", issues);
		model.addAttribute("unameSize", uname.size());
		model.addAttribute("uname", uname);
		model.addAttribute("milestone", milestone);
		model.addAttribute("fileList", fileList);
		
        return "milestones/detailMilestone";
	}
	
	@RequestMapping("/{uno}/{pno}/milestones/new")
	public String  newMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model, Milestone milestones) {
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		
		return "/milestones/newMilestone";
	}
	
	@RequestMapping("/milestones/regist")
	public String  regist(int uno, int pno, @ModelAttribute("milestones")	Milestone milestone, BindingResult result, HttpServletRequest request){
		logger.info("title : "+milestone.getMtitle());
		logger.info("description : "+milestone.getMdescription());
		logger.info("duedate : " + milestone.getMduedate());
		logger.info("pno : " + milestone.getPno());
		milestonesService.saveMilestone(milestone, request);
		
		return "redirect:/"+uno+"/"+pno+"/milestones/open";
	}
	
	@RequestMapping(value="/milestones/edit/{uno}/{pno}/{mno}", method = RequestMethod.GET)
	public String edit(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno, @ModelAttribute("milestones") Milestone milestone, Model model){
		milestone = milestonesService.getMilestoneBymno(mno);
		// mno로 파일 리스트 불러오기
		List<Files> fileList = milestonesService.getFileListByMno(mno);
				
		logger.info("---------------edit page------------------");
		logger.info("mno : " + milestone.getMno());
		logger.info("mtitle : " +milestone.getMtitle());
		logger.info("mdescription : " + milestone.getMdescription());
		logger.info("mduedate : " + milestone.getMduedate());

		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("milestones", milestone);
		model.addAttribute("fileList", fileList);
		
		return "/milestones/editMilestone";
	}
	
	@RequestMapping(value="/milestones/edit", method = RequestMethod.POST)
	public String editing(int uno, int pno, @ModelAttribute("milestones") Milestone milestone, BindingResult result){
		logger.info("---------------editing page------------------");
		logger.info("mno : " + milestone.getMno());
		logger.info("mtitle : " + milestone.getMtitle());
		logger.info("mduedate : " + milestone.getMduedate());

		milestonesService.editMilestoneBymno(milestone);
		
		return "redirect:/"+uno+"/"+pno+"/milestones/open";
	}
	
	@RequestMapping("/milestones/remove/{uno}/{pno}/{mno}")
	public String  remove(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno){
		milestonesService.removeMilestone(mno);
		
		return "redirect:/"+uno+"/"+pno+"/milestones/open";
	}
	
	@RequestMapping("/milestones/closeMilestone/{uno}/{pno}/{mno}")
	public String  closeMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno){
		milestonesService.closeMilestone(mno);
		
		return "redirect:/"+uno+"/"+pno+"/milestone/"+mno;
	}
	
	@RequestMapping("/milestones/reopenMilestone/{uno}/{pno}/{mno}")
	public String  reopenMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno){
		milestonesService.reopenMilestone(mno);
		
		return "redirect:/"+uno+"/"+pno+"/milestone/"+mno;
	}
	
	@RequestMapping(value="/milestones/ajax", method = RequestMethod.POST)
	public void ajax(int item, String place, int uno){
		HashMap<String, Object> param = new HashMap<>();
		if(place.equals("unstarted1")){
			param.put("ino", item);
			param.put("istatement", "000");
			param.put("uno", 0);
			milestonesService.editIssueByIno(param);
		}
		else if(place.equals("unstarted2")){
			param.put("ino", item);
			param.put("istatement", "000");
			param.put("uno", uno);
			milestonesService.editIssueByIno(param);
		}
		else if(place.equals("completed")){
			param.put("ino", item);
			param.put("istatement", "001");
			milestonesService.editIssueByIno(param);
		}
		else{
			
		}
	}
}