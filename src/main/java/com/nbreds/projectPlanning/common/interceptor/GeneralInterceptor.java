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

public class GeneralInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	RequestService requestService;
	
	@Autowired
	CommonController common;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uno = String.valueOf(request.getSession().getAttribute("user_no"));
		
		//요청 Projects
		List<HashMap<String, Object>> projects = requestService.getProjectByUno(uno);
		if(projects.size() > 0){
			for (HashMap<String, Object> project : projects) {
				int pno = (int) project.get("pno");
				int countAllMilestone = requestService.getCountAllMilestone(pno);
				double completeMilestonPercent = requestService.getCountClosedMilestone(pno);
				project.put("completeIssuePercent", Math.round((completeMilestonPercent / countAllMilestone) * 100));
			}
			request.setAttribute("projects", projects);
		}
		else	request.setAttribute("projects", "none");
		
		//request project
		int req = requestService.getCountRequestProjects(uno);
		List<HashMap<String, Object>> messages = requestService.getMessagesByUno(uno);
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
