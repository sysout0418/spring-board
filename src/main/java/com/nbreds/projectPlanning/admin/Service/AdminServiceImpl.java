package com.nbreds.projectPlanning.admin.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.admin.Dao.AdminDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDao adminDao;

	@Override
	public List<Project> get5Projects() {
		return adminDao.get5Projects();
	}

	@Override
	public List<User> get5Users() {
		return adminDao.get5Users();
	}

	@Override
	public int getCountUsers() {
		return adminDao.getCountUsers();
	}

	@Override
	public int getCountProjects() {
		return adminDao.getCountProjects();
	}

	@Override
	public List<Project> getAllProjects(Map<String, Object> param) {
		return adminDao.getAllProjects(param);
	}
	
	@Override
	public int totalProjectCount(Map<String, Object> param) {
		return adminDao.totalProjectCount(param);
	}
	
	@Override
	public void removeProjects(int i) {
		adminDao.removeProjects(i);
	}
	
	@Override
	@Transactional
	public void removeUsersByUno(int uno) {
		try {
			// 탈퇴 처리. User 테이블 expired 컬럼값 N에서 Y로 update
			adminDao.removeUsersByUno(uno);
			
			// 탈퇴 처리 시켰으니 Authority 테이블 enabled 컬럼값 0으로 다시 update
			denyUserByUno(uno);
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	@Override
	public void recoverUsersByUno(int uno) {
		// 탈퇴 복구 처리. User 테이블 expired 컬럼값 N으로 update
		adminDao.recoverUsersByUno(uno);
	}
	
	@Override
	@Transactional
	public void admitUserByUno(int uno) {
		try {
			// 가입 승인 처리. Authority 테이블 enabled 컬럼값 1으로 update
			adminDao.admitUserByUno(uno);
			
			// 승인 처리 했는데 만약 User 테이블 expired가 Y면 안되므로 N으로 update
			recoverUsersByUno(uno);
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	public void denyUserByUno(int uno) {
		// 가입 거절 처리. Authority 테이블 enabled 컬럼값 0으로 update
		adminDao.denyUserByUno(uno);
	}
	
	@Override
	public List<User> selectAllUser(Map<String, Object> param) {
		return adminDao.selectAllUser(param);
	}

	@Override
	public int totalUserCount(Map<String, Object> param) {
		return adminDao.totalUserCount(param);
	}
	
	@Override
	public List<CodeTable> getDepartmentList(String codeType) {
		return adminDao.getDepartmentList(codeType);
	}
	
	@Override
	public List<Project> getProjectsByPname(String item) {
		return adminDao.getProjectsByPname(item);
	}

	@Override
	public List<Project> getProjectsByUname(String item) {
		return adminDao.getProjectsByUname(item);
	}

	@Override
	public User getUserInfoByUno(int uno) {
		return adminDao.getUserInfoByUno(uno);
	}

}