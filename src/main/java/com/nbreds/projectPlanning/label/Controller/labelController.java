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

import com.nbreds.projectPlanning.label.Service.labelService;
import com.nbreds.projectPlanning.label.VO.Label;

@Controller
public class labelController {
	private static final Logger logger = LoggerFactory.getLogger(labelController.class);
	
	@Autowired
	labelService service;
	
	@RequestMapping("/{uno}/{pno}/labels")
	public String  labels(@PathVariable("uno") int uno, @PathVariable("pno") int pno, Model model) {
		List<Label> list = service.getLabelsByPno(pno);
		
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
		
		service.saveLabel(label);
		
		return "redirect:/"+uno+"/"+pno+"/labels";
	}
}