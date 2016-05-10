package com.nbreds.projectPlanning.common.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.nbreds.projectPlanning.HomeController;

@ControllerAdvice
public class CommonExceptionHandler{
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionHandler.class);
	
	@ExceptionHandler(Exception.class)
	public String getExceptionHandler(){
		return "error/error";
	}
}
