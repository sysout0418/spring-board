package com.nbreds.projectPlanning.issueLabel.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;

@Repository
public class IssueLabelDAO {
	//dsssds
	@Autowired
	private SqlSession sqlSession;
	
	public void saveIssueLabel(IssueLabel issueLabel) {
		sqlSession.insert("issueLabel.saveIssueLabel", issueLabel);
	}
	
}
