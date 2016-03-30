package com.nbreds.projectPlanning.issues.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issues.Dao.issuesDAO;
import com.nbreds.projectPlanning.issues.VO.Issues;

@Service
public class issuesService {
	@Autowired
	issuesDAO issuesdao;
	
	public void saveIssues(Issues issues) {
		issuesdao.saveIssues(issues);
	}
	
	public List<Issues> getAllIssues() {
		return issuesdao.getAllIssues();
	}

	public Issues getIssuesByIno(int ino) {
		return issuesdao.getIssuesByIno(ino);
	}

	public List<Issues> getIssuesByPno(Map<String, Object> param) {
		return issuesdao.getIssuesByPno(param);
	}
	
	public List<Issues> getIssuesByUno(Map<String, Object> param) {
		return issuesdao.getIssuesByUno(param);
	}
	
	public void updateIssueByIno(Issues issues) {
		issuesdao.updateIssueByIno(issues);
	}
	
	public void removeIssues(int ino) {
		issuesdao.removeIssues(ino);
	}
	
	public User getUserForNo(int uno) {
		return issuesdao.getUserForNo(uno);
	}
	
	public void closeIssue(Map<String, Object> param) {
		issuesdao.closeIssue(param);
	}
	
	public int getLastIno() {
		return issuesdao.getLastIno();
	}
}
