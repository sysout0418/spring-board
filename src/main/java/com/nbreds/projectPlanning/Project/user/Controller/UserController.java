package com.nbreds.projectPlanning.Project.user.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.user.Service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoinForm() {
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("UserInfo") User user) {
		logger.info("uname: ", user.getUname());
		logger.info("uphoneno: ", user.getUphoneno());
		logger.info("udepartment: ", user.getUdepartment());
		logger.info("uemail: ", user.getUemail());
		logger.info("uposition: ", user.getUposition());
		logger.info("upassword: ", user.getUpassword());
		User userInfo = userService.checkUserById(user.getUemail());
		if (userInfo == null) {
			userService.saveUser(user);
			return "redirect:/";
		}
		return "joinError";
	}

	@RequestMapping("/checkId")
	public void checkId(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String uemail = request.getParameter("uemail");
		if (uemail.indexOf("@") != -1) {
			User userInfo = userService.checkUserById(uemail);
			if (userInfo != null) {
				response.getWriter().write("Y");
			} else {
				response.getWriter().write("N");
			}
		} else {
			response.getWriter().write("N2");
		}
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
}