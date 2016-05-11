package com.nbreds.projectPlanning.login.Controller;

import java.io.IOException;
import java.util.List;

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

import com.nbreds.projectPlanning.common.VO.Authority;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.login.Service.LoginService;
import com.nbreds.projectPlanning.login.Service.ShaEncoder;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	LoginService loginService;
	
	@Autowired
	ShaEncoder encoder;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoinForm() {
		return "user/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("UserInfo") User user) {
		User userInfo = loginService.checkUserById(user.getUemail());
		if (userInfo == null) {
			//sha256인코딩
			String pw = encoder.encoding(user.getUpassword());
			user.setUpassword(pw);
			
			loginService.saveUser(user);
			return "redirect:/";
		}
		return "user/joinError";
	}

	@RequestMapping("/checkId")
	public void checkId(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String uemail = request.getParameter("uemail");
		if (uemail.indexOf("@") != -1) {
			User userInfo = loginService.checkUserById(uemail);
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
		return "user/loginForm";
	}
}