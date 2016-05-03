package com.nbreds.projectPlanning.Project.listProjects.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.Project.listProjects.Dao.ListDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service("ListService")
public class ListServiceImpl implements ListService {
	static final Logger logger = LoggerFactory.getLogger(ListServiceImpl.class);
	
	@Autowired
	ListDao listDao;

	public int getTotalProjectNo() {
		int totalProjectNo = 0;
		totalProjectNo = listDao.count();
		
		return totalProjectNo;	
	}

	public List<HashMap<String, Object>> getPageList(HashMap<String, Integer> param) {
		listDao.setRownum();
		return listDao.getPageList(param);
	}

	public HashMap<String, Object> getProjectByPno(int pno) {
		return listDao.getProjectByPno(pno);
	}

	public void removeProject(int pno) {
		listDao.removeProject(pno);
	}

	@Override
	@Transactional
	public void updateProject(Project project, String requestUserNoList) {
		try {
			listDao.updateProject(project);
			ProjectMemberStat projectMS = new ProjectMemberStat();
			projectMS.setPno(project.getPno());
			String[] requestUserNos = requestUserNoList.split(",");
			if (requestUserNos != null && !requestUserNos[0].equals("")) {
				deleteMSByPno(project.getPno());
				for (int i = 0; i < requestUserNos.length; i++) {
					projectMS.setUno(Integer.parseInt(requestUserNos[i]));
					saveProjectMS(projectMS);
				}
			} else {
				deleteMSByPno(project.getPno());
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	public User getUserForNo(int uno) {
		return listDao.getUserForNo(uno);
	}
	
	@Override
	public int getParticipateUserCnt(int pno) {
		return listDao.getParticipateUserCnt(pno);
	}
	
	@Override
	public List<ProjectMemberStat> getParticipateUserList(int pno) {
		return listDao.getParticipateUserList(pno);
	}
	
	@Override
	public List<User> getAllUser() {
		return listDao.getAllUser();
	}
	
	@Override
	public void deleteMSByPno(int pno) {
		listDao.deleteMSByPno(pno);
	}
	
	@Override
	public void saveProjectMS(ProjectMemberStat projectMS) {
		listDao.saveProjectMS(projectMS);
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return listDao.getCodeTable(CODE_TYPE);
	}
	
	public List<User> getUsersForName(String uname) {
		return listDao.getUsersForName(uname);
	}

	@Override
	public int getCountAllMilestone(int pno) {
		return listDao.getCountAllMilestone(pno);
	}

	@Override
	public double getCountClosedMilestone(int pno) {
		return listDao.getCountClosedMilestone(pno);
	}

	@Override
	public List<HashMap<String, Object>> getRequestMember(int pno) {
		return listDao.getRequestMember(pno);
	}

	@Override
	public List<HashMap<String, Object>> getActivityByPno(int pno) {
		return listDao.getActivityByPno(pno);
	}

	@Override
	public int getcountAllIssue(int pno) {
		return listDao.getcountAllIssue(pno);
	}
}