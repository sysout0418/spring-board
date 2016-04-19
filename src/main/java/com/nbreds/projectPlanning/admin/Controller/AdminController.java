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
		List<User> newUserList = adminService.selectNewUser();
		int newCount = newUserList.size();
		int allCount = adminService.countAllUser();
		
		model.addAttribute("newUserList", newUserList);
		model.addAttribute("newCount", newCount);
		model.addAttribute("allCount", allCount);
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
	public String projects() {
		
		return "/admin/allProjects";
	}
	
	@ModelAttribute("department")
	public List<CodeTable> getDepartmentList(){
		List<CodeTable> departmentList = adminService.getDepartmentList("002");
		
		return departmentList;
	}
}
