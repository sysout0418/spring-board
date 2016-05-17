package com.nbreds.projectPlanning.Project.registProject.Service;

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
import com.nbreds.projectPlanning.Project.registProject.Dao.RegistDao;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.Email;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.common.mail.EmailSender;
import com.nbreds.projectPlanning.issues.VO.Label;

@Service("RegistService")
public class RegistServiceImpl implements RegistService{
	private static final Logger logger = LoggerFactory.getLogger(RegistServiceImpl.class);	
	
	@Autowired
	private RegistDao registDao;
	
	@Autowired
	private EmailSender emailSender;
	
	@Transactional
	public void savePrjAndPrjMS(Project project, String requestedUserNoList) {
		try {
			registDao.saveProject(project);
			int maxPno = getLastno();
			ProjectMemberStat projectMS = new ProjectMemberStat();
			projectMS.setPno(maxPno);
			
			// 임시 stat 저장
			projectMS.setStat("000");
			if (!requestedUserNoList.equals("")) {
				String[] unos = requestedUserNoList.split(",");
				for (int i = 0; i < unos.length; i++) {
					projectMS.setUno(Integer.parseInt(unos[i]));
					registDao.saveProjectMS(projectMS);
					
					// 사용자에게 플젝 요청 됐다는 이메일 발송
					HashMap<String, Object> userInfo = getUserForNo(Integer.parseInt(unos[i]));
					if (userInfo != null) {
						Email email = new Email();
						email.setReciver((String) userInfo.get("uemail"));
						email.setSubject("[BIDDING] 프로젝트 요청");
						email.setContent("[BIDDING] 프로젝트 요청 \n" 
										+ "프로젝트명: " + project.getPname() + "\n"
										+ "위 프로젝트에 참여 요청이 왔습니다. \n"
										+ "자세한 사항은 bidding.nbreds.com에 접속하여 확인하세요.");
						emailSender.SendEmail(email);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	public int getLastno() {
		return registDao.getLastno();
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return registDao.getCodeTable(CODE_TYPE);
	}

	public List<User> getUsersForName(String uname) {
		return registDao.getUsersForName(uname);
	}

	public HashMap<String, Object> getUserForNo(int uno) {
		return registDao.getUserForNo(uno);
	}

	@Override
	public List<User> getAllUser() {
		return registDao.getAllUser();
	}

	@Override
	public List<Label> getAllLabel() {
		return registDao.getAllLabel();
	}

}