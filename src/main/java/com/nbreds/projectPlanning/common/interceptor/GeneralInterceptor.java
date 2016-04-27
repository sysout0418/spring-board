package com.nbreds.projectPlanning.common.interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nbreds.projectPlanning.HomeController;
import com.nbreds.projectPlanning.Project.common.Controller.CommonController;
import com.nbreds.projectPlanning.Project.requestProjects.Service.RequestService;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

public class GeneralInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	RequestService requestService;
	
	@Autowired
	CommonController common;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uno = String.valueOf(request.getSession().getAttribute("user_no"));
		
		//요청 milestones
		List<HashMap<String, Object>> milestones = requestService.getMilestonesByUno(uno);
		if(milestones.size() > 0){
			for (HashMap<String, Object> milestone : milestones) {
				int mno = (int) milestone.get("mno");
				int countIssues = requestService.countIssuesByMno(mno);
				double completeIssuePercent = requestService.countClosedIssueByMno(mno);
				
				milestone.put("CompleteIssuePercent", (int) Math.round((completeIssuePercent / countIssues) * 100));
			}
			request.setAttribute("milestone", milestones);
		}
		else	request.setAttribute("milestone", "none");
		
		//request project
		int req = requestService.getCountRequestProjects(uno);
		List<HashMap<String, Object>> messages = requestService.getMessagesByUno(uno);
		request.setAttribute("milestones", milestones);
		request.setAttribute("req", req);
		
		if(messages.size() > 0){
			for (HashMap<String, Object> message : messages) {
				String date = common.calculateTime((Date)message.get("regDate"));
				message.put("regDate", date);
			}
			request.setAttribute("message", messages);
		}
		else	request.setAttribute("message", "none");
		
        return true;
    }
}
