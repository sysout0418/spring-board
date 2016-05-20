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
public class RegistServiceImpl implements RegistService {
	private static final Logger logger = LoggerFactory.getLogger(RegistServiceImpl.class);

	@Autowired
	private RegistDao registDao;

	@Autowired
	private EmailSender emailSender;

	@Transactional
	public void savePrjAndPrjMS(Project project) {
		//프로젝트 등록
		registDao.saveProject(project);
		
		for (String newMember : project.getRequestMember()) {
			//statement저장
			ProjectMemberStat stat = new ProjectMemberStat();
			stat.setPno(project.getPno());
			stat.setUno(Integer.parseInt(newMember));
			
			registDao.saveProjectMS(stat);
			
			//메일전송
			Email email = new Email();
	        
	        email.setReciver(registDao.getEmailByUno(Integer.parseInt(newMember)));
	        email.setSubject("[BIDDING] 프로젝트 요청");
	        		email.setContent("[BIDDING] 프로젝트 요청 \n" 
							+ "프로젝트명: " + project.getPname() + "\n"
							+ "위 프로젝트에 참여 요청이 왔습니다. \n"
							+ "자세한 사항은 bidding.nbreds.com에 접속하여 확인하세요.");
	        		
	        try {
				emailSender.SendEmail(email);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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