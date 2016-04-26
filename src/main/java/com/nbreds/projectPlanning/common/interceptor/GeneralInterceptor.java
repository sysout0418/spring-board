package com.nbreds.projectPlanning.common.interceptor;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nbreds.projectPlanning.HomeController;
import com.nbreds.projectPlanning.Project.requestProjects.Service.RequestService;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

public class GeneralInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	RequestService requestService;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String uno = String.valueOf(request.getSession().getAttribute("user_no"));
		
		List<Milestone> milestones = requestService.getMilestones(uno);
		int req = requestService.getCountRequestProjects(uno);
		List<HashMap<String, Object>> messages = requestService.getMessages(uno);
		
		request.setAttribute("milestones", milestones);
		request.setAttribute("req", req);
		request.setAttribute("messages", messages);
		
        return true;
    }
}
