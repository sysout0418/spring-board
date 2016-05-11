package com.nbreds.projectPlanning.mypage.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface MyPageService {
	static final Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);

	User getUserInfoByUno(int uno);

	List<CodeTable> getAllDepartmentList();

}
