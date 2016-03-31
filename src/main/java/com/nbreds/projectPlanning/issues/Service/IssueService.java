package com.nbreds.projectPlanning.issues.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service
public interface IssueService {
	static final Logger logger = LoggerFactory.getLogger(IssueServiceImpl.class);

	public void saveIssues(Issue issues);
	
	public List<Issue> getAllIssues();

	public Issue getIssuesByIno(int ino);

	public List<Issue> getIssuesByPno(Map<String, Object> param);
	
	public List<Issue> searchIssues(Map<String, Object> param);
	
	public List<Milestone> getAllMilestone();
	
	public void updateIssueByIno(Issue issues);
	
	public void removeIssues(int ino);

	public User getUserForNo(int uno);
	
	public void closeIssue(Map<String, Object> param);

	public int getLastIno();
	
	public List<Label> getAllLabel();
	
	public List<User> getAllUserNameAndNo();
	
	public List<Label> getLabelsByIno(int ino);
	
	public void saveIssueLabel(IssueLabel issueLabel);
	
	public void removeIssueLabelForUpdate(Issue issues);
	
	public List<Issue> getIssuesByUno(Map<String, Object> param);

	public List<Issue> searchIssuesByParam(Map<String, Object> param);
}
