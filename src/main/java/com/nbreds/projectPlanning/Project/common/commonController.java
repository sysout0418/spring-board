package com.nbreds.projectPlanning.Project.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.Project.registProject.Service.registService;

@Controller
public class commonController {
	private static final Logger logger = LoggerFactory.getLogger(commonController.class);
	
	@Autowired
	registService service;
	
	//ajax통신
		@RequestMapping("/nameList")
		public @ResponseBody List<String> GetNameList() {
			List<User> userList = service.getAllUserNameAndNo();
			List<String> userNames = new ArrayList<String>();
			for (int i = 0; i < userList.size(); i++) {
				userNames.add(userList.get(i).getUname());
			}
			return userNames;
//			List<User> list = service.getUsersForName(value);
//			
//			List<HashMap<String,Object>> lst = new ArrayList<HashMap<String,Object>>();
//			for(int i=0; i<list.size(); i++){
//				HashMap<String,Object> hsm = new HashMap<String,Object>();
//				hsm.put("data", list.get(i).getUname());
//				hsm.put("uno", list.get(i).getUno());
//				lst.add(hsm);
//			}
//			
//			return lst;
		}
}
