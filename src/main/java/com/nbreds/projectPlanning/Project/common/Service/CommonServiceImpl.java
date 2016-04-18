package com.nbreds.projectPlanning.Project.common.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.common.Dao.CommonDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service("CommonService")
public class CommonServiceImpl implements CommonService{
	private static final Logger logger = LoggerFactory.getLogger(CommonServiceImpl.class);	
	
	@Autowired
	CommonDao commonDao;
	
	// 03-22 추가
	// 모든 유저의 이름과 유저번호 가져옴
	public List<User> getAllUserNameAndNo() {
		return commonDao.getAllUserNameAndNo();
	}
	
	public CodeTable getCodeName(HashMap<String, String> param) {
		return commonDao.getCodeName(param);
	}
}