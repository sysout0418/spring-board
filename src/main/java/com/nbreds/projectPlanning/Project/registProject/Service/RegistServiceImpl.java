package com.nbreds.projectPlanning.Project.registProject.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.Project.registProject.Dao.RegistDao;
import com.nbreds.projectPlanning.common.util.CodeTable;
import com.nbreds.projectPlanning.common.util.User;

@Service("RegistService")
public class RegistServiceImpl implements RegistService{
	private static final Logger logger = LoggerFactory.getLogger(RegistServiceImpl.class);	
	
	@Autowired
	private RegistDao registDao;
	
	@Transactional
	public void savePrjAndPrjMS(Project project, ProjectMemberStat projectMS) {
		try {
			registDao.saveProject(project);
			int maxPno = getLastno();
			projectMS.setPno(maxPno);
			
			// 임시 stat 저장
			projectMS.setStat("000");
			String uno = project.getPmember();
			if (!uno.equals("")) {
				String[] unos = uno.split(",");
				for (int i = 0; i < unos.length; i++) {
					projectMS.setUno(Integer.parseInt(unos[i]));
					registDao.saveProjectMS(projectMS);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
//	public void saveProject(Project project) {
//		registDao.saveProject(project);
//	}	
//
//	public void saveProjectMS(ProjectMemberStat projectMS) {
//		registDao.saveProjectMS(projectMS);
//	}
	
	public int getLastno() {
		return registDao.getLastno();
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return registDao.getCodeTable(CODE_TYPE);
	}

	public List<User> getUsersForName(String uname) {
		return registDao.getUsersForName(uname);
	}

	public User getUserForNo(int uno) {
		return registDao.getUserForNo(uno);
	}
	
	// 03-22 추가
	// 모든 유저의 이름과 유저번호 가져옴
	public List<User> getAllUserNameAndNo() {
		return registDao.getAllUserNameAndNo();
	}
}
