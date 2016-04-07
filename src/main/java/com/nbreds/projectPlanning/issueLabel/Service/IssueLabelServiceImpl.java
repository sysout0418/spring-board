package com.nbreds.projectPlanning.issueLabel.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.issueLabel.Dao.IssueLabelDao;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;

@Service("IssueLabelServiceImpl")
public class IssueLabelServiceImpl implements IssueLabelService {
	private static final Logger logger = LoggerFactory.getLogger(IssueLabelServiceImpl.class);
	
	@Autowired
	IssueLabelDao issueLabelDAO;
	
	public void saveIssueLabel(IssueLabel issueLabel) {
		issueLabelDAO.saveIssueLabel(issueLabel);
	}
}
