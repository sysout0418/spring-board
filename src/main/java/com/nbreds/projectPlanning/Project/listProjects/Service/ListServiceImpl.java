package com.nbreds.projectPlanning.Project.listProjects.Service;

import java.util.ArrayList;
import java.util.Arrays;
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
import com.nbreds.projectPlanning.common.VO.Email;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.common.mail.EmailSender;
import com.nbreds.projectPlanning.issues.VO.Label;

@Service("ListService")
public class ListServiceImpl implements ListService {
	static final Logger logger = LoggerFactory.getLogger(ListServiceImpl.class);
	
	@Autowired
	ListDao listDao;
	
	@Autowired
	private EmailSender emailSender;

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
			List<ProjectMemberStat> getParticipateUserListByPno = getParticipateUserListByPno(project.getPno());
			
			List<ProjectMemberStat> getParticipateUserListByUno = new ArrayList<ProjectMemberStat>();
			String[] requestUserNos = requestUserNoList.split(",");
			ArrayList<String> requestUserNoList1 = new ArrayList<String>(Arrays.asList(requestUserNos));
			
			getParticipateUserListByUno.clear();
			for (int i = 0; i < requestUserNoList1.size(); i++) {
				getParticipateUserListByUno = getParticipateUserListByUno(Integer.parseInt(requestUserNoList1.get(i)));
			}
			deleteMSByPno(project.getPno());
			
			for (int i = 0; i < requestUserNoList1.size(); i++) {
//				if (getParticipateUserListByUno.isEmpty()) {
					projectMS.setUno(Integer.parseInt(requestUserNos[i]));
					saveProjectMS(projectMS);
					
					User userInfo = getUserForNo(Integer.parseInt(requestUserNoList1.get(i)));
					Email email = new Email();
					email.setReciver((String) userInfo.getUemail());
					email.setSubject("[BIDDING] 프로젝트 요청");
					email.setContent("[BIDDING] 프로젝트 요청 \n" 
							+ "프로젝트명: " + project.getPname() + "\n"
							+ "위 프로젝트에 참여 요청이 왔습니다. \n"
							+ "자세한 사항은 bidding.nbreds.com에 접속하여 확인하세요.");
					emailSender.SendEmail(email);
//				} else {
//					projectMS.setUno(Integer.parseInt(requestUserNos[i]));
//					saveProjectMS(projectMS);
//				}
			}
			logger.info("requestUserNoList1 size : " + requestUserNoList1.size());
			logger.info("getParticipateUserListByPno size : " + getParticipateUserListByPno.size());
			
//			if (!participatingUserList.isEmpty()) {
//				for (int i = 0; i < participatingUserList.size(); i++) {
//					int participatingUserNo = participatingUserList.get(i).getUno();
//					for (int j = 0; j < requestUserNoList1.size(); j++) {
//						if (requestUserNoList1.get(j).equals(String.valueOf(participatingUserNo))) {
//							break;
//						} else {
//							newParticipatingUserList.add(requestUserNoList1.get(j));
//						}
//					}
//				}
//			}
//			
//			logger.info("newParticipatingUserList : " + newParticipatingUserList.isEmpty());
//			if (requestUserNos != null && !requestUserNos[0].equals("")) {
//				for (int i = 0; i < requestUserNos.length; i++) {
//					for (int j = 0; j < participatingUserList.size(); j++) {
//						if (Integer.parseInt(requestUserNos[i]) == participatingUserList.get(j).getUno()) {
//							originalParticipatingUserList.add(requestUserNos[i]); // 146, 149
//						} else {
//							newParticipatingUserList.add(requestUserNos[i]); // 149, 146
//						}
//					}
//				}
//				
//				for (int i = 0; i < originalParticipatingUserList.size(); i++) {
//					deleteMSByUno(Integer.parseInt(originalParticipatingUserList.get(i)));
//				}
//				
//				for (int i = 0; i < requestUserNos.length; i++) {
//					projectMS.setUno(Integer.parseInt(requestUserNos[i]));
//					saveProjectMS(projectMS);
//				}
//				
//				logger.info("requestUserNos size : " + requestUserNos.length);
//				logger.info("originalParticipatingUserList size : " + originalParticipatingUserList.size());
//				logger.info("newParticipatingUserList size : " + newParticipatingUserList.size());
//				
//				for (int i = 0; i < newParticipatingUserList.size(); i++) {
//					User userInfo = getUserForNo(Integer.parseInt(newParticipatingUserList.get(i)));
//					if (userInfo != null) {
//						Email email = new Email();
//						email.setReciver((String) userInfo.getUemail());
//						email.setSubject("[BIDDING] 프로젝트 요청");
//						email.setContent("[BIDDING] 프로젝트 요청 \n" 
//								+ "프로젝트명: " + project.getPname() + "\n"
//								+ "위 프로젝트에 참여 요청이 왔습니다. \n"
//								+ "자세한 사항은 bidding.nbreds.com에 접속하여 확인하세요.");
//						emailSender.SendEmail(email);
//					}
//				}
				
//				for (int i = 0; i < requestUserNos.length; i++) {
//					for (int j = 0; j < participatingUserList.size(); j++) {
//						if (Integer.parseInt(requestUserNos[i]) == participatingUserList.get(j).getUno()) {
//							deleteMSByUno(participatingUserList.get(j).getUno());
//							projectMS.setUno(Integer.parseInt(requestUserNos[i]));
//							saveProjectMS(projectMS);
//						} else {
//							deleteMSByUno(Integer.parseInt(requestUserNos[i]));
//							projectMS.setUno(Integer.parseInt(requestUserNos[i]));
//							saveProjectMS(projectMS);
//							// 사용자에게 플젝 요청 됐다는 이메일 발송
//							User userInfo = getUserForNo(Integer.parseInt(requestUserNos[i]));
//							if (userInfo != null) {
//								Email email = new Email();
//								email.setReciver((String) userInfo.getUemail());
//								email.setSubject("[BIDDING] 프로젝트 요청");
//								email.setContent("[BIDDING] 프로젝트 요청 \n" 
//										+ "프로젝트명: " + project.getPname() + "\n"
//										+ "위 프로젝트에 참여 요청이 왔습니다. \n"
//										+ "자세한 사항은 bidding.nbreds.com에 접속하여 확인하세요.");
//								emailSender.SendEmail(email);
//							}
//						}
//					}
//				}
//			} else {
//				deleteMSByPno(project.getPno());
//			}
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
	public List<ProjectMemberStat> getParticipateUserListByPno(int pno) {
		return listDao.getParticipateUserListByPno(pno);
	}
	
	@Override
	public List<ProjectMemberStat> getParticipateUserListByUno(int uno) {
		return listDao.getParticipateUserListByUno(uno);
	}
	
	@Override
	public List<User> getAllUser() {
		return listDao.getAllUser();
	}
	
	@Override
	public void deleteMSByUno(int uno) {
		listDao.deleteMSByUno(uno);
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

	@Override
	public Project getUpdateProjectByPno(int pno) {
		return listDao.getUpdateProjectByPno(pno);
	}

	@Override
	public List<Label> getAllLabel() {
		return listDao.getAllLabel();
	}
}