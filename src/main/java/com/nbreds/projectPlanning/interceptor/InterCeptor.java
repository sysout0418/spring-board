package com.nbreds.projectPlanning.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class InterCeptor extends HandlerInterceptorAdapter {
	/** Spring Security 적용으로 인하여 InterCeptor는 저 먼 기억 속으로... 그동안 고마웠다 */
	private static final Logger logger = LoggerFactory.getLogger(HandlerInterceptorAdapter.class);
//	
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//		super.afterCompletion(request, response, handler, ex);
//	}
//
//	@Override
//	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		// TODO Auto-generated method stub
//		super.afterConcurrentHandlingStarted(request, response, handler);
//	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("======================================          START         ======================================");
		logger.info("Request URI \t:  " + request.getRequestURI());
		try {
			// user_no 세션값이 null일 경우
			if (request.getSession().getAttribute("user_no") == null) {
				// 로그인 페이지로 redirect
				response.sendRedirect("/");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// null이 아니면 정상적으로 컨트롤러 호출
		return true;
	}
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		logger.info("======================================           END          ======================================\n");
//		super.postHandle(request, response, handler, modelAndView);
//	}


}
