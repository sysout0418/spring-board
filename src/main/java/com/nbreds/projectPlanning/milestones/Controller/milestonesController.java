package com.nbreds.projectPlanning.milestones.Controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

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

import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.milestones.Service.milestonesService;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Controller
public class milestonesController {
	private static final Logger logger = LoggerFactory.getLogger(milestonesController.class);
	
	@Autowired
	milestonesService service;
	
	@RequestMapping(value = "/milestones/{statement}", method = RequestMethod.GET)
	public String home(@PathVariable("statement") String stat, Model model, HttpSession session) {
		String uno = String.valueOf(session.getAttribute("user_no")); //세션의 uno
		List<Milestones> list;
		HashMap<String, Object> param = new HashMap<>();
		if(stat.equals("open")){
			param.put("uno", uno);
			param.put("mstatement", "000");
			list = service.getJoinMilestones(param);
		}
		else if(stat.equals("closed")){
			param.put("uno", uno);
			param.put("mstatement", "001");
			list = service.getJoinMilestones(param);
		}
		else{
			param.put("uno", uno);
			list = service.getJoinMilestones(param);
		}
		for (Milestones milestone : list) {
			int countIssues = service.countIssuesByMno(milestone.getMno());
			double completeIssuePercent = service.countClosedIssueByMno(milestone.getMno());
			milestone.setCountIssues(countIssues);
			milestone.setCompleteIssuePercent((int)Math.round((completeIssuePercent / countIssues) *100));	
		}
		
		model.addAttribute("stat", stat);
		model.addAttribute("list", list);
		
        return "milestones/milestones";
	}
	
	@RequestMapping("/{uno}/{pno}/milestones/{statement}")
	public String  milestones(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("statement") String stat, Model model) {
		List<Milestones> list;
		HashMap<String, Object> param = new HashMap<>();
		if(stat.equals("open")){
			param.put("pno", pno);
			param.put("mstatement", "000");
			list = service.getMilestonesByPno(param);
		}
		else if(stat.equals("closed")){
			param.put("pno", pno);
			param.put("mstatement", "001");
			list = service.getMilestonesByPno(param);
		}
		else{
			param.put("pno", pno);
			list = service.getMilestonesByPno(param);
		}
		for (Milestones milestone : list) {
			int countIssues = service.countIssuesByMno(milestone.getMno());
			double completeIssuePercent = service.countClosedIssueByMno(milestone.getMno());
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
		Milestones milestone = service.getMilestoneBymno(mno);
		
		int countIssues = service.countIssuesByMno(mno); //총 issue갯수
		int countOpenIssues = service.countOpenIssuesByMno(mno);//open issue갯수
		double countClosedIssues = service.countClosedIssueByMno(mno);//closed issue갯수
		int completeIssuePercent = (int) Math.round((countClosedIssues / countIssues) *100); //완료 percentage
		
		List<Issues> issues = service.getIssuesBymno(mno);
		HashSet<String> uname = new HashSet<>();
		for (Issues issue : issues) {
			String param = String.valueOf(issue.getUno());
			uname.add(service.getUnameByUno(param));
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
		Milestones milestone = service.getMilestoneBymno(mno);
		
		int countIssues = service.countIssuesByMno(mno); //총 issue갯수
		int countOpenIssues = service.countOpenIssuesByMno(mno);//open issue갯수
		double countClosedIssues = service.countClosedIssueByMno(mno);//closed issue갯수
		int completeIssuePercent = (int) Math.round((countClosedIssues / countIssues) *100); //완료 percentage
		
		List<Issues> issues = service.getIssuesBymno(mno);
		HashSet<String> uname = new HashSet<>();
		for (Issues issue : issues) {
			if(issue.getUno() != 0){
				String param = String.valueOf(issue.getUno());
				uname.add(service.getUnameByUno(param));
				}
		}
		
		model.addAttribute("countIssues", countIssues);
		model.addAttribute("countOpenIssues", countOpenIssues);
		model.addAttribute("countClosedIssues", countClosedIssues);
		model.addAttribute("completeIssuePercent", completeIssuePercent);
		model.addAttribute("issues", issues);
		model.addAttribute("unameSize", uname.size());
		model.addAttribute("uname", uname);
		model.addAttribute("milestone", milestone);
		
        return "milestones/detailMilestone";
	}
	
	@RequestMapping("/{uno}/{pno}/milestones/new")
	public String  newMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model, Milestones milestones) {
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		
		return "/milestones/newMilestone";
	}
	
	@RequestMapping("/milestones/regist")
	public String  regist(int uno, int pno, @ModelAttribute("milestones")	Milestones milestone, BindingResult result){
		logger.info("title : "+milestone.getMtitle());
		logger.info("description : "+milestone.getMdescription());
		logger.info("duedate : " + milestone.getMduedate());
		logger.info("pno : " + milestone.getPno());
		service.saveMilestone(milestone);
		
		return "redirect:/"+uno+"/"+pno+"/milestones/open";
	}
	
	@RequestMapping(value="/milestones/edit/{uno}/{pno}/{mno}", method = RequestMethod.GET)
	public String edit(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno, @ModelAttribute("milestones") Milestones milestone, Model model){
		milestone = service.getMilestoneBymno(mno);
		logger.info("---------------edit page------------------");
		logger.info("mno : " + milestone.getMno());
		logger.info("mtitle : " +milestone.getMtitle());
		logger.info("mdescription : " + milestone.getMdescription());
		logger.info("mduedate : " + milestone.getMduedate());

		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("milestones", milestone);
		
		return "/milestones/editMilestone";
	}
	
	@RequestMapping(value="/milestones/edit", method = RequestMethod.POST)
	public String editing(int uno, int pno, @ModelAttribute("milestones") Milestones milestone, BindingResult result){
		logger.info("---------------editing page------------------");
		logger.info("mno : " + milestone.getMno());
		logger.info("mtitle : " + milestone.getMtitle());
		logger.info("mduedate : " + milestone.getMduedate());

		service.editMilestoneBymno(milestone);
		
		return "redirect:/"+uno+"/"+pno+"/milestones/open";
	}
	
	@RequestMapping("/milestones/remove/{uno}/{pno}/{mno}")
	public String  remove(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno){
		service.removeMilestone(mno);
		
		return "redirect:/"+uno+"/"+pno+"/milestones/open";
	}
	
	@RequestMapping("/milestones/closeMilestone/{uno}/{pno}/{mno}")
	public String  closeMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno){
		service.closeMilestone(mno);
		
		return "redirect:/"+uno+"/"+pno+"/milestone/"+mno;
	}
	
	@RequestMapping("/milestones/reopenMilestone/{uno}/{pno}/{mno}")
	public String  reopenMilestone(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("mno") int mno){
		service.reopenMilestone(mno);
		
		return "redirect:/"+uno+"/"+pno+"/milestone/"+mno;
	}
	
	@RequestMapping(value="/milestones/ajax", method = RequestMethod.POST)
	public void ajax(int item, String place, int uno){
		HashMap<String, Object> param = new HashMap<>();
		if(place.equals("unstarted1")){
			param.put("ino", item);
			param.put("istatement", "000");
			param.put("uno", 0);
			service.editIssueByIno(param);
		}
		else if(place.equals("unstarted2")){
			param.put("ino", item);
			param.put("istatement", "000");
			param.put("uno", uno);
			service.editIssueByIno(param);
		}
		else if(place.equals("completed")){
			param.put("ino", item);
			param.put("istatement", "001");
			service.editIssueByIno(param);
		}
		else{
			
		}
	}
}