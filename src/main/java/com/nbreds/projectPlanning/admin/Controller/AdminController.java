package com.nbreds.projectPlanning.admin.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.nbreds.projectPlanning.common.util.PageBean;
import com.nbreds.projectPlanning.common.util.PageUtility;

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
	
	@RequestMapping("/admin/users")
	public String users(Model model, HttpServletRequest request) throws Exception {
		String word = request.getParameter("word");
		String key = request.getParameter("key");
		String page = request.getParameter("pageNo");
		logger.info(word);
		logger.info(key);
		logger.info(page);
		int pageNo;
		try {
			pageNo = Integer.parseInt(page);
		} catch (Exception e) {
			// page 정보가 전송되지 않은 경우 이므로 첫 페이지로 처리하기위해.
			pageNo = 1;
		}
		// 페이지빈 생성자로 페이지 정보 셋팅하고 Map으로 값 SQL.xml로 전달
		PageBean pageBean = new PageBean(key, word, null, pageNo);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", key);
		param.put("word", word);
		param.put("start", pageBean.getStart());
		param.put("interval", pageBean.getInterval());
		
		// 페이지바 생성
		int totalUserCnt = adminService.totalUserCount(param);
		PageUtility bar = new PageUtility(pageBean.getInterval(), totalUserCnt, pageBean.getPageNo());
		pageBean.setPagelink(bar.getPageBar());
		
		// 유저 리스트 가져오기
		List<User> allUserList = adminService.selectAllUser(param);
		
		// 코드 한글화
		List<CodeTable> departmentCodeList = getDepartmentList();
		for (int i = 0; i < allUserList.size(); i++) {
			for (int j = 0; j < departmentCodeList.size(); j++) {
				if (allUserList.get(i).getUdepartment().equals(departmentCodeList.get(j).getCODE())) {
					allUserList.get(i).setUdepartmentName(departmentCodeList.get(j).getCODE_NAME());
				}
			}
		}
		
		model.addAttribute("allUserList", allUserList);
		model.addAttribute("pageBean", pageBean);
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
