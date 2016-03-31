package com.nbreds.projectPlanning.issueLabel.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.issueLabel.Dao.IssueLabelDAO;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;

@Service
public class IssueLabelService {

	@Autowired
	IssueLabelDAO issueLabelDAO;
	
	public void saveIssueLabel(IssueLabel issueLabel) {
		issueLabelDAO.saveIssueLabel(issueLabel);
	}
	
}
