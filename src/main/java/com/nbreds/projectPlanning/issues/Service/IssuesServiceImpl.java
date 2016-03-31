package com.nbreds.projectPlanning.issues.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.Dao.IssuesDAO;
import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.label.Service.LabelServiceImpl;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Service("IssuesService")
public class IssuesServiceImpl implements IssuesService {
	private static final Logger logger = LoggerFactory.getLogger(IssuesServiceImpl.class);
	
	@Autowired
	IssuesDAO issuesdao;
	
	@Override
	public void saveIssues(Issues issues) {
		issuesdao.saveIssues(issues);
	}
	
	@Override
	public List<Issues> getAllIssues() {
		return issuesdao.getAllIssues();
	}

	@Override
	public Issues getIssuesByIno(int ino) {
		return issuesdao.getIssuesByIno(ino);
	}

	@Override
	public List<Issues> getIssuesByPno(Map<String, Object> param) {
		return issuesdao.getIssuesByPno(param);
	}
	
	@Override
	public List<Issues> searchIssues(Map<String, Object> param) {
		return issuesdao.searchIssues(param);
	}
	
	@Override
	public List<Milestones> getAllMilestone() {
		return issuesdao.getAllMilestone();
	}
	
	@Override
	public void updateIssueByIno(Issues issues) {
		issuesdao.updateIssueByIno(issues);
	}
	
	@Override
	public void removeIssues(int ino) {
		issuesdao.removeIssues(ino);
	}
	
	@Override
	public User getUserForNo(int uno) {
		return issuesdao.getUserForNo(uno);
	}
	
	@Override
	public void closeIssue(Map<String, Object> param) {
		issuesdao.closeIssue(param);
	}
	
	@Override
	public int getLastIno() {
		return issuesdao.getLastIno();
	}
	
	//
	@Override
	public List<Label> getAllLabel() {
		return issuesdao.getAllLabel();
	}
	
	@Override
	public List<User> getAllUserNameAndNo() {
		return issuesdao.getAllUserNameAndNo();
	}
	
	@Override
	public List<Label> getLabelsByIno(int ino) {
		return issuesdao.getLabelsByIno(ino);
	}
	
	@Override
	public void saveIssueLabel(IssueLabel issueLabel) {
		issuesdao.saveIssueLabel(issueLabel);
	}
	
	@Override
	public void removeIssueLabelForUpdate(Issues issues) {
		issuesdao.removeIssueLabelForUpdate(issues);
	}
	
	// uno로 이슈 가져오기
	@Override
	public List<Issues> getIssuesByUno(Map<String, Object> param) {
		return issuesdao.getIssuesByUno(param);
	}
	
	// 들어온 param에 따라 이슈 검색하기
	@Override
	public List<Issues> searchIssuesByParam(Map<String, Object> param) {
		return issuesdao.searchIssuesByParam(param);
	}
	
}
