package com.nbreds.projectPlanning.Project.common.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface CommonService {
	// 03-22 추가
	// 모든 유저의 이름과 유저번호 가져옴
	public List<User> getAllUserNameAndNo();
	
	public CodeTable getCodeName(HashMap<String, String> param);
}
