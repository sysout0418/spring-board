package com.nbreds.projectPlanning.Project.common.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbreds.projectPlanning.Project.common.Service.CommonService;
import com.nbreds.projectPlanning.common.VO.User;

@Controller
public class CommonController {
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	CommonService commonService;
	
	//ajax통신
	@RequestMapping("/nameList")
	public @ResponseBody List<String> GetNameList() {
		List<User> userList = commonService.getAllUserNameAndNo();
		List<String> userNames = new ArrayList<String>();
		for (int i = 0; i < userList.size(); i++) {
			userNames.add(userList.get(i).getUname());
		}
		return userNames;
	}
	
	public String getCodeName(String code){
		HashMap<String,String> param = new HashMap<String,String>();
		if (code != null) {
			param.put("CODE_TYPE", code.substring(0, 3));
			param.put("CODE", code.substring(3, 6));
		}
		
		return commonService.getCodeName(param).getCODE_NAME();
	}
	
	public Object getCodeForCodeType(String pdata, String type) {
		String[] data = pdata.split(",");
		
		List <String>skills = new ArrayList<String>();
		String progress = "";
		
		for (String str : data) {
			String sub = str.substring(0,3);
			if(sub.equals("004") || sub.equals("005") || sub.equals("006"))
				skills.add(str);
			else if(sub.equals("011"))
				progress = str;
		}
		
		if(type.equals("skills")) return skills;
		if(type.equals("progress")) return progress;
		else return "fail";
	}
}