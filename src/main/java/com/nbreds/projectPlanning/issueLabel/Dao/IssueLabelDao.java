package com.nbreds.projectPlanning.issueLabel.Dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;

@Repository("IssueLabelDao")
public class IssueLabelDao {
	private static final Logger logger = LoggerFactory.getLogger(IssueLabelDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public void saveIssueLabel(IssueLabel issueLabel) {
		sqlSession.insert("issuesLabel.saveIssueLabel", issueLabel);
	}
	
}
