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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.admin.Service.AdminService;
import com.nbreds.projectPlanning.common.VO.Authority;
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
		List<HashMap<String, Object>> user = adminService.get5Users();
		model.addAttribute("user", user);
		
		List<HashMap<String, Object>> project = adminService.get5Projects();
		model.addAttribute("project", project);

		model.addAttribute("countUsers", countUsers);
		model.addAttribute("countProjects", countProjects);

		return "/admin/index";
	}
	
	@RequestMapping("/admin/users")
	public String users(Model model, HttpServletRequest request) throws Exception {
		String word = request.getParameter("word");
		String key = request.getParameter("key");
		String page = request.getParameter("pageNo");
		logger.info("검색어: " + word);
		logger.info("검색조건: " + key);
		logger.info("pageNo: " + page);
		
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
		
		// 부서 코드 한글화
		List<CodeTable> departmentCodeList = getDepartmentList();
		for (int i = 0; i < allUserList.size(); i++) {
			for (int j = 0; j < departmentCodeList.size(); j++) {
				if (allUserList.get(i).getUdepartment() != null) {
					if (allUserList.get(i).getUdepartment().equals(departmentCodeList.get(j).getCODE())) {
						allUserList.get(i).setUdepartmentName(departmentCodeList.get(j).getCODE_NAME());
					}
				}
			}
		}
		int countUsers = adminService.getCountUsers();
		
		request.setAttribute("allUserList2", allUserList);
		model.addAttribute("allUserList", allUserList);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("countUsers", countUsers);
		return "/admin/allUsers";
	}
	
	@RequestMapping("/admin/projects")
	public String projects(Model model, HttpServletRequest request) throws Exception {
		String word = request.getParameter("word");
		String key = request.getParameter("key");
		String page = request.getParameter("pageNo");
		logger.info("검색어: " + word);
		logger.info("검색조건: " + key);
		logger.info("pageNo: " + page);
		
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
		int totalPrjCnt = adminService.totalProjectCount(param);
		PageUtility bar = new PageUtility(pageBean.getInterval(), totalPrjCnt, pageBean.getPageNo());
		pageBean.setPagelink(bar.getPageBar());
		
		int countProjects = adminService.getCountProjects();
		List<Project> project = adminService.getAllProjects(param);
		
		model.addAttribute("countProjects", countProjects);
		model.addAttribute("project", project);
		model.addAttribute("pageBean", pageBean);
		
		return "/admin/allProjects";
	}
	
	@RequestMapping("/admin/projects/delete")
	public String deleteProjects(HttpServletRequest request) {
		String[] checkedPnoList = request.getParameterValues("pno");
		if (checkedPnoList != null) {
			for (int i = 0; i < checkedPnoList.length; i++) {
				logger.info("checkedPnoList[" + i + "] : " + checkedPnoList[i]);
				adminService.removeProjects(Integer.parseInt(checkedPnoList[i]));
			}
		}
		
		return "redirect:/admin/projects";
	}
	
	// 회원 탈퇴. User 테이블 expired 컬럼값 'N' -> 'Y' 로 update
	@RequestMapping("/admin/users/delete")
	public String deleteUsers(HttpServletRequest request) {
		String[] deleteUsers = request.getParameterValues("cbList");
		String uno = request.getParameter("uno");
		
		if (deleteUsers != null) {
			for (int i = 0; i < deleteUsers.length; i++) {
				logger.info("deleteUsers[" + i + "] : " + deleteUsers[i]);
				adminService.removeUsersByUno(Integer.parseInt(deleteUsers[i]));
			}
		} else if (uno != null && !uno.equals("")) {
			adminService.removeUsersByUno(Integer.parseInt(uno));
		}
		
		return "redirect:/admin/users";
	}
	
	// 회원 탈퇴 복구. User 테이블 expired 컬럼값 'Y' -> 'N' 로 update
	@RequestMapping("/admin/users/recover")
	public String recoverUsers(HttpServletRequest request) {
		String[] recoverUsers = request.getParameterValues("cbList");
		String uno = request.getParameter("uno");
		
		if (recoverUsers != null) {
			for (int i = 0; i < recoverUsers.length; i++) {
				logger.info("recoverUsers[" + i + "] : " + recoverUsers[i]);
				adminService.recoverUsersByUno(Integer.parseInt(recoverUsers[i]));
			}
		} else if (uno != null && !uno.equals("")) {
			adminService.recoverUsersByUno(Integer.parseInt(uno));
		}
		
		return "redirect:/admin/users";
	}
	
	// 가입 허가. Authority 테이블 enabled 컬럼값 0 -> 1 로 update
	@RequestMapping("/admin/users/admit")
	public String admitUser(HttpServletRequest request) {
		String[] admitUnoList = request.getParameterValues("cbList");
		String uno = request.getParameter("uno");
		
		if (admitUnoList != null) {
			for (int i = 0; i < admitUnoList.length; i++) {
				logger.info("admitUnoList[" + i + "] : " + admitUnoList[i]);
				adminService.admitUserByUno(Integer.parseInt(admitUnoList[i]));
			}
		} else if (uno != null && !uno.equals("")) {
			adminService.admitUserByUno(Integer.parseInt(uno));
		}
		
		return "redirect:/admin/users";
	}
	
	// 가입 거절. Authority 테이블 enabled 컬럼 값 0으로 update
	@RequestMapping("/admin/users/deny")
	public String denyUser(HttpServletRequest request) {
		String[] denyUnoList = request.getParameterValues("cbList");
		String uno = request.getParameter("uno");
		
		if (denyUnoList != null) {
			for (int i = 0; i < denyUnoList.length; i++) {
				logger.info("denyUnoList[" + i + "] : " + denyUnoList[i]);
				adminService.denyUserByUno(Integer.parseInt(denyUnoList[i]));
			}
		} else if (uno != null && !uno.equals("")) {
			adminService.denyUserByUno(Integer.parseInt(uno));
		}
		
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/admin/users/editForm/{uno}")
	public String userEditForm(@PathVariable("uno") int uno, Model model) {
		logger.info("uno: " + uno);
		User userInfo = adminService.getUserInfoByUno(uno);
		List<Authority> authorityList = adminService.getAllAuthority();
		List<CodeTable> departmentList = adminService.getAllDepartmentList();
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("authorityList", authorityList);
		model.addAttribute("departmentList", departmentList);
		
		return "/admin/userEditForm";
	}

	@RequestMapping("/admin/users/edit")
	public String userEdit(HttpServletRequest request, int uno, String checkAdmit, String checkExpired, 
			String uname, String uphoneno, String udepartment, String authority) {
		logger.info("uno: " + uno);
		logger.info("checkAdmit: " + checkAdmit);
		logger.info("checkExpired: " + checkExpired);
		logger.info("uname: " + uname);
		logger.info("uphoneno: " + uphoneno);
		logger.info("udepartment: " + udepartment);
		logger.info("authority: " + authority);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uno", uno);
		param.put("enabled", checkAdmit);
		param.put("expired", checkExpired);
		param.put("uname", uname);
		param.put("uphoneno", uphoneno);
		param.put("udepartment", udepartment);
		if (authority.equals("일반 회원")) {
			param.put("authority", "ROLE_USER");
		} else if (authority.equals("프로젝트 매니저")) {
			param.put("authority", "ROLE_MANAGER");
		} else {
			param.put("authority", "ROLE_ADMIN");
		}
		
		adminService.updateUserInfo(param);
		
		return "redirect:/admin/users";
	}
	
	@ModelAttribute("department")
	public List<CodeTable> getDepartmentList(){
		List<CodeTable> departmentList = adminService.getDepartmentList("002");
		
		return departmentList;
	}
}