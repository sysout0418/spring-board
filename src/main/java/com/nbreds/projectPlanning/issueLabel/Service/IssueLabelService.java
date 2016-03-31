package com.nbreds.projectPlanning.issueLabel.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;

@Service
public interface IssueLabelService {
	static final Logger logger = LoggerFactory.getLogger(IssueLabelServiceImpl.class);

	public void saveIssueLabel(IssueLabel issueLabel);
}
