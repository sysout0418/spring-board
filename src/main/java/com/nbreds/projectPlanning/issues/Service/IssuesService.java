package com.nbreds.projectPlanning.issues.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Service
public interface IssuesService {
	static final Logger logger = LoggerFactory.getLogger(IssuesService.class);
	
	public void saveIssues(Issues issues);
	
	public List<Issues> getAllIssues();
	

	public Issues getIssuesByIno(int ino);

	public List<Issues> getIssuesByPno(Map<String, Object> param);
	
	public List<Issues> searchIssues(Map<String, Object> param);
	
	public List<Milestones> getAllMilestone();
	
	public void updateIssueByIno(Issues issues);
	
	public void removeIssues(int ino);
	
	public User getUserForNo(int uno);
	
	public void closeIssue(Map<String, Object> param);
	
	public int getLastIno();
	
	//
	public List<Label> getAllLabel();
	
	public List<User> getAllUserNameAndNo();
	
	public List<Label> getLabelsByIno(int ino);
	
	public void saveIssueLabel(IssueLabel issueLabel);
	
	public void removeIssueLabelForUpdate(Issues issues);
	
	// uno로 이슈 가져오기
	public List<Issues> getIssuesByUno(Map<String, Object> param);
	
	// 들어온 param에 따라 이슈 검색하기
	public List<Issues> searchIssuesByParam(Map<String, Object> param);
}
