package com.nbreds.projectPlanning.admin.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.admin.Dao.AdminDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDao adminDao;

	@Override
	public int countAllUser() {
		return adminDao.countAllUser();
	}
	
	@Override
	public List<User> selectNewUser() {
		return adminDao.selectNewUser();
	}
	
	@Override
	public List<User> selectAllUser() {
		return adminDao.selectAllUser();
	}

	@Override
	public List<CodeTable> getDepartmentList(String codeType) {
		return adminDao.getDepartmentList(codeType);
	}


}