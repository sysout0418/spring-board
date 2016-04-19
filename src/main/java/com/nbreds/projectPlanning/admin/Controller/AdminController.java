package com.nbreds.projectPlanning.admin.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.admin.Service.AdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home() {

		return "/admin/index";
	}
	
	@RequestMapping(value = "/admin/users", method = RequestMethod.GET)
	public String users() {

		return "/admin/allUsers";
	}
	
	@RequestMapping(value = "/admin/projects", method = RequestMethod.GET)
	public String projects() {

		return "/admin/allProjects";
	}
}
