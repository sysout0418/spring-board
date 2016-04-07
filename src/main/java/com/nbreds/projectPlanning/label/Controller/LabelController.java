package com.nbreds.projectPlanning.label.Controller;

import java.util.List;

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

import com.nbreds.projectPlanning.label.Service.LabelService;
import com.nbreds.projectPlanning.label.VO.Label;

@Controller
public class LabelController {
	private static final Logger logger = LoggerFactory.getLogger(LabelController.class);
	
	@Autowired
	LabelService labelService;
	
	@RequestMapping("/{uno}/{pno}/labels")
	public String  labels(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model) {
		List<Label> list = labelService.getLabelsByPno(pno);
		
		model.addAttribute("list", list);
		return "/label/labels";
	}
	
	@RequestMapping("/{uno}/{pno}/label/new")
	public String newLabel(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model, Label label) {
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		
		return "/label/newLabel";
	}
	
	@RequestMapping("/label/regist")
	public String  regist(int uno, int pno, @ModelAttribute("label")	Label label, BindingResult result){
		logger.info("title : "+label.getLtitle());
		logger.info("description : "+label.getLdescription());
		logger.info("bgcolor : " + label.getLbgcolor());
		label.setPno(pno);
		
		labelService.saveLabel(label);
		
		return "redirect:/"+uno+"/"+pno+"/labels";
	}
	
	@RequestMapping("/label/edit/{uno}/{pno}/{lno}")
	public String editLabel(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("lno") int lno, @ModelAttribute("label") Label label, Model model) {
		label = labelService.getLabelByLno(lno);
		
		model.addAttribute("uno", uno);
		model.addAttribute("pno", pno);
		model.addAttribute("label", label);
		
		return "/label/editLabel";
	}
	
	@RequestMapping(value="/label/edit", method = RequestMethod.POST)
	public String editing(int uno, int pno, @ModelAttribute("label") Label label, BindingResult result){
		labelService.editLabelBylno(label);
		
		return "redirect:/"+uno+"/"+pno+"/labels";
	}
	
	@RequestMapping("/label/remove/{uno}/{pno}/{lno}")
	public String remove(@PathVariable("uno") int uno, @PathVariable("pno") int pno, @PathVariable("lno") int lno) {
		labelService.removeLabel(lno);
		
		return "redirect:/"+uno+"/"+pno+"/labels";
	}
}