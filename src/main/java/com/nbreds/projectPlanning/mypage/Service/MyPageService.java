package com.nbreds.projectPlanning.mypage.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.CodeTable;

@Service
public interface MyPageService {
	static final Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);

	HashMap<String, String> getUserInfoByUno(int uno);

	List<CodeTable> getAllDepartmentList();

}
