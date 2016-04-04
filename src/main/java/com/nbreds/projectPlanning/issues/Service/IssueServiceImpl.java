package com.nbreds.projectPlanning.issues.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.Dao.IssueDao;
import com.nbreds.projectPlanning.issues.VO.Comment;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestone;
import com.nbreds.projectPlanning.util.FileUtils;

@Service("IssueService")
public class IssueServiceImpl implements IssueService {
	private static final Logger logger = LoggerFactory.getLogger(IssueServiceImpl.class);

	@Autowired
	IssueDao issueDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public void saveIssues(Issue issues, HttpServletRequest request) {
		issueDao.saveIssues(issues);

		// 파일정보 DB에 INSERT
		List<Map<String, Object>> list;
		int lastIno = getLastIno();
		try {
			issues.setIno(lastIno);
			list = fileUtils.parseInsertFileInfo(issues, request);
			for (int i = 0; i < list.size(); i++) {
				issueDao.saveIssueFile(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	public void updateIssueByIno(Issue issues) {
		issueDao.updateIssueByIno(issues);
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
}