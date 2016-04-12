package com.nbreds.projectPlanning.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nbreds.projectPlanning.HomeController;
import com.nbreds.projectPlanning.Project.myProjects.Service.MyProjectService;

public class GeneralInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MyProjectService myProjectService;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String uno = String.valueOf(request.getSession().getAttribute("user_no"));
		int req = myProjectService.getCountRequestProjects(uno);
		request.setAttribute("req", req);
		
        return true;
    }
}
