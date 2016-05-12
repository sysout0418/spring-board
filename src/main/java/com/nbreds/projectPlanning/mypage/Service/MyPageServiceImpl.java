package com.nbreds.projectPlanning.mypage.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.mypage.Dao.MyPageDao;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {
	private static final Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);

	@Autowired
	MyPageDao myPageDao;

	@Override
	public HashMap<String, String> getUserInfoByUno(int uno) {
		return myPageDao.getUserInfoByUno(uno);
	}

	@Override
	public List<CodeTable> getAllDepartmentList() {
		return myPageDao.getAllDepartmentList();
	}

	@Override
	public void editProfile(HashMap<String, Object> param) {
		myPageDao.editProfile(param);
	}
}