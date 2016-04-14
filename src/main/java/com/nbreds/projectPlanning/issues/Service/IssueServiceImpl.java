package com.nbreds.projectPlanning.issues.Service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.common.util.FileUtils;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.Dao.IssueDao;
import com.nbreds.projectPlanning.issues.VO.Comment;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service("IssueService")
public class IssueServiceImpl implements IssueService {
	private static final Logger logger = LoggerFactory.getLogger(IssueServiceImpl.class);

	@Autowired
	IssueDao issueDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	// 파일 정보를 담고 있는 list
	List<Map<String, Object>> list;

	@Override
	@Transactional
	public void saveIssues(Issue issues) {
		try {
			// issue 정보 DB Issues 테이블에 ISNERT
			issueDao.saveIssues(issues);
			
			// 파일정보 DB Files 테이블에 INSERT
			for (int i = 0; i < list.size(); i++) {
				saveIssueFile(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}

	@Override
	public void sendFileToServer(Map<String, Object> param) {
		int lastIno = getLastIno() + 1;
		param.put("ino", lastIno);
		try {
			list = fileUtils.parseInsertFileInfo(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ino로 파일 리스트 가져오기
	@Override
	public List<Files> getFileListByIno(int ino) {
		return issueDao.getFileListByIno(ino);
	}

	// fno로 파일 정보 가져오기
	@Override
	public Files getFileInfoByFno(int fno) {
		return issueDao.getFileInfoByFno(fno);
	}

	@Override
	public List<Issue> getAllIssues() {
		return issueDao.getAllIssues();
	}

	@Override
	public Issue getIssuesByIno(int ino) {
		return issueDao.getIssuesByIno(ino);
	}

	@Override
	public List<Issue> getIssuesByPno(Map<String, Object> param) {
		return issueDao.getIssuesByPno(param);
	}

	@Override
	public List<Issue> searchIssues(Map<String, Object> param) {
		return issueDao.searchIssues(param);
	}

	@Override
	public List<Milestone> getAllMilestone() {
		return issueDao.getAllMilestone();
	}


	@Override
	@Transactional
	public void updateIssueByIno(Issue issues, HttpServletRequest request) {
		try {
			// 이슈 정보 업뎃
			issueDao.updateIssueByIno(issues);

			// IssueFiles 테이블의 isDel 컬럼값을 조건 ino이용하여 Y로 변경
			issueDao.deleteFileList(issues.getIno());

			// 파일정보 업뎃
			List<Map<String, Object>> list;
			list = fileUtils.parseUpdateFileInfo(issues, request);
			Map<String, Object> param = null;
			for (int i = 0; i < list.size(); i++) {
				param = list.get(i);
				if (param.get("IS_NEW").equals("Y")) {
					issueDao.saveIssueFile(param);
				} else {
					issueDao.updateFile(param);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}

	@Override
	public void removeIssues(int ino) {
		issueDao.removeIssues(ino);
	}

	@Override
	public User getUserForNo(int uno) {
		return issueDao.getUserForNo(uno);
	}

	@Override
	public void closeIssue(Map<String, Object> param) {
		issueDao.closeIssue(param);
	}

	@Override
	public void reopenIssue(Map<String, Object> param) {
		issueDao.reopenIssue(param);
	}

	@Override
	public int getLastIno() {
		return issueDao.getLastIno();
	}

	@Override
	public List<Label> getAllLabel() {
		return issueDao.getAllLabel();
	}

	@Override
	public List<User> getAllUserNameAndNo() {
		return issueDao.getAllUserNameAndNo();
	}

	@Override
	public List<Label> getLabelsByIno(int ino) {
		return issueDao.getLabelsByIno(ino);
	}

	@Override
	public void saveIssueLabel(IssueLabel issueLabel) {
		issueDao.saveIssueLabel(issueLabel);
	}

	@Override
	public void removeIssueLabelForUpdate(Issue issues) {
		issueDao.removeIssueLabelForUpdate(issues);
	}

	@Override
	public List<Issue> getIssuesByUno(Map<String, Object> param) {
		return issueDao.getIssuesByUno(param);
	}

	@Override
	public List<Issue> searchIssuesByParam(Map<String, Object> param) {
		return issueDao.searchIssuesByParam(param);
	}

	@Override
	public List<Comment> getCommentByIno(int ino) {
		return issueDao.getCommentByIno(ino);
	}

	@Override
	public void saveComment(Map<String, Object> param) {
		issueDao.saveComment(param);
	}

	@Override
	public void updateComment(Map<String, Object> param) {
		issueDao.updateComment(param);
	}

	@Override
	public void removeCommentByCno(int cno) {
		issueDao.removeCommentByCno(cno);
	}

	@Override
	public void deleteFileList(int ino) {
		issueDao.deleteFileList(ino);
	}

	@Override
	public void updateFile(Map<String, Object> param) {
		issueDao.updateFile(param);
	}

	@Override
	public void saveIssueFile(Map<String, Object> param) {
		issueDao.saveIssueFile(param);
	}

}