package com.nbreds.projectPlanning.Project.listProjects.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void updateProject(Project project, List<String> list) {
		// 프로젝트 업데이트
		listDao.updateProject(project);

		// 기존 프로젝트에 요청되어 있는 사람 목록
		List<HashMap<String, Object>> oldMembers = listDao.getParticipateUsers(project.getPno());
		logger.info("기존 요청 목록 : " + oldMembers);

		// 새 프로젝트 요청 인원 목록
		List<String> newMembers = project.getRequestMember();
			logger.info("새로운 요청 목록 : " + newMembers);
			
			for(int j = 0; j<newMembers.size(); j++){
				for (int i=0; i<oldMembers.size(); i++) { 
					if (newMembers.get(j).equals(String.valueOf(oldMembers.get(i).get("uno")))) {
						newMembers.remove(j);
					}
				}
			}
			
			logger.info("추가할 사람 목록 : " + newMembers);
				
			// 상태값 저장
			for (String newMember : newMembers) {
				ProjectMemberStat stat = new ProjectMemberStat();
				stat.setPno(project.getPno());
				stat.setUno(Integer.parseInt(newMember));
	
				listDao.saveProjectMS(stat);
	
				Email email = new Email();
	
				//email.setReciver(listDao.getEmailByUno(Integer.parseInt(newMember)));
				email.setReciver("hyoin123@nate.com");
				email.setSubject("[BIDDING] 프로젝트 요청");
				email.setContent("[BIDDING] 프로젝트 요청 \n" + "프로젝트명: " + project.getPname() + "\n" + "위 프로젝트에 참여 요청이 왔습니다. \n"
						+ "자세한 사항은 bidding.nbreds.com에 접속하여 확인하세요.");
	
				try {
					emailSender.SendEmail(email);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				logger.info("추가된 사람 목록 : " + newMember);
				
				// 기존 멤버에서 삭제해야 할 사람 찾기
				for (int i=0; i<oldMembers.size(); i++) { 
					if (!(list.contains(String.valueOf(oldMembers.get(i).get("uno"))))) {
						HashMap<String, Object> param = new HashMap<>();
						param.put("uno", oldMembers.get(i).get("uno"));
						param.put("pno", project.getPno());
		
						listDao.deleteMS(param);
						logger.info("삭제해야 할 사람 uno : " + oldMembers.get(i).get("uno") + ", pno : " + project.getPno());
					}
				}
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

	@Override
	public void deleteMSAll(int pno) {
		listDao.deleteMSAll(pno);
	}
}