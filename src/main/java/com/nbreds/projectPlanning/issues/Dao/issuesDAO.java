package com.nbreds.projectPlanning.issues.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Repository
public class issuesDAO {
	@Autowired
	private SqlSession sqlSession;

	public void saveIssues(Issues issues) {
		sqlSession.insert("issues.saveIssues", issues);
	}
	
	public List<Issues> getAllIssues() {
		return sqlSession.selectList("issues.getAllIssues");
	}

	public Issues getIssuesByIno(int ino) {
		return sqlSession.selectOne("issues.getIssuesByIno", ino);
	}

	public List<Issues> getIssuesByPno(Map<String, Object> param) {
		return sqlSession.selectList("issues.getIssuesByPno", param);
	}
	
	public List<Issues> searchIssues(Map<String, Object> param) {
		return sqlSession.selectList("issues.searchIssues", param);
	}
	
	public List<Milestones> getAllMilestone() {
		return sqlSession.selectList("issues.getAllMilestone");
	}
	
	public void updateIssueByIno(Issues issues) {
		sqlSession.update("issues.updateIssues", issues);
	}
	
	public void removeIssues(int ino) {
		sqlSession.delete("issues.removeIssues", ino);
	}

	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.getUserForNo", uno);
	}
	
	public void closeIssue(Map<String, Object> param) {
		sqlSession.update("issues.closeIssue", param);
	}
	
	public int getLastIno() {
		return sqlSession.selectOne("issues.getLastIno");
	}
}