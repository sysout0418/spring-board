package com.nbreds.projectPlanning.admin.Controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.admin.Service.AdminService;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home(Model model) {
		int countUsers = adminService.getCountUsers();
		int countProjects = adminService.getCountProjects();
		List<User> user = adminService.get5Users();
		List<Project> project = adminService.get5Projects();
		
		model.addAttribute("countUsers", countUsers);
		model.addAttribute("countProjects", countProjects);
		model.addAttribute("user", user);
		model.addAttribute("project", project);
		
		return "/admin/index";
	}
	
	@RequestMapping(value = "/admin/users", method = RequestMethod.GET)
	public String users(Model model) {
		List<User> allUserList = adminService.selectAllUser();
		List<CodeTable> departmentCodeList = getDepartmentList();
		for (int i = 0; i < allUserList.size(); i++) {
			for (int j = 0; j < departmentCodeList.size(); j++) {
				if (allUserList.get(i).getUdepartment().equals(departmentCodeList.get(j).getCODE())) {
					allUserList.get(i).setUdepartmentName(departmentCodeList.get(j).getCODE_NAME());
				}
			}
		}
		
		model.addAttribute("allUserList", allUserList);
		return "/admin/allUsers";
	}
	
	@RequestMapping(value = "/admin/projects", method = RequestMethod.GET)
	public String projects(Model model) {
		int countProjects = adminService.getCountProjects();
		List<Project> project = adminService.getAllProjects();
		
		model.addAttribute("countProjects", countProjects);
		model.addAttribute("project", project);
		
		return "/admin/allProjects";
	}
	
	@RequestMapping(value = "/admin/projects/delete", method = RequestMethod.POST)
	public String deleteprojects(int pno[]) {
		System.out.println(pno);
		for (int i : pno) {
			System.out.println(i);
		}
		
		return "redirect:/admin/projects";
	}
	
	@ModelAttribute("department")
	public List<CodeTable> getDepartmentList(){
		List<CodeTable> departmentList = adminService.getDepartmentList("002");
		
		return departmentList;
	}
}
