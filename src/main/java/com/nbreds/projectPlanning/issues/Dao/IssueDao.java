package com.nbreds.projectPlanning.issues.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.issues.VO.Comment;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.issues.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Repository("IssueDao")
public class IssueDao {
	private static final Logger logger = LoggerFactory.getLogger(IssueDao.class);	
	
	@Autowired
	private SqlSession sqlSession;

	public void saveIssues(Issue issues) {
		sqlSession.insert("issues.saveIssues", issues);
	}
	
	// 파일 정보 DB에 INSERT
	public void saveIssueFile(Map<String, Object> param) {
		sqlSession.insert("issues.saveIssueFile", param);
	}
	
	// ino로 파일 정보 DB에서 SELECT
	public List<Files> getFileListByIno(int ino) {
		return sqlSession.selectList("issues.getFileListByIno", ino);
	}
	
	// fno로 파일 정보 DB에서 SELECT
	public Files getFileInfoByFno(int fno) {
		return sqlSession.selectOne("issues.getFileInfoByFno", fno);
	}
	
	public List<Issue> getAllIssues() {
		return sqlSession.selectList("issues.getAllIssues");
	}

	public Issue getIssuesByIno(int ino) {
		return sqlSession.selectOne("issues.getIssuesByIno", ino);
	}
	
	public Issue getIssuesByIno2(int ino) {
		return sqlSession.selectOne("issues.getIssuesByIno2", ino);
	}

	public List<Issue> getIssuesByPno(Map<String, Object> param) {
		return sqlSession.selectList("issues.getIssuesByPno", param);
	}
	
	public List<Issue> searchIssues(Map<String, Object> param) {
		return sqlSession.selectList("issues.searchIssues", param);
	}
	
	public List<Milestone> getMilestoneByPno(int pno) {
		return sqlSession.selectList("issues.getMilestoneByPno", pno);
	}
	
	public List<Milestone> getAllMilestone() {
		return sqlSession.selectList("issues.getAllMilestone");
	}
	
	public void updateIssueByIno(Issue issues) {
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
	
	public void reopenIssue(Map<String, Object> param) {
		sqlSession.update("issues.reopenIssue", param);
	}
	
	public int getLastIno() {
		return sqlSession.selectOne("issues.getLastIno");
	}
	
	public List<Label> getAllLabel() {
		return sqlSession.selectList("issues.getAllLabel");
	}
	
	public List<User> getUserListByPno(int pno) {
		return sqlSession.selectList("issues.getUserListByPno", pno);
	}
	
	public List<User> getAllUserNameAndNo() {
		return sqlSession.selectList("issues.getAllUserNameAndNo");
	}
	
	public List<Label> getLabelsByIno(int ino) {
		return sqlSession.selectList("issues.getLabelsByIno", ino);
	}
	
//	public void saveIssueLabel(IssueLabel issueLabel) {
//		sqlSession.insert("issues.saveIssueLabel", issueLabel);
//	}
	
	public void removeIssueLabelForUpdate(Issue issues) {
		sqlSession.delete("issues.removeIssueLabelForUpdate", issues);
	}

	public List<Issue> getIssuesByUno(Map<String, Object> param) {
		return sqlSession.selectList("issues.getIssuesByUno", param);
	}

	public int getCommentCnt(int ino) {
		return sqlSession.selectOne("issues.getCommentCnt", ino);
	}
	
	public List<Issue> getProjectInfoByUno(Map<String, Object> param) {
		return sqlSession.selectList("issues.getProjectInfoByUno", param);
	}
	
	public List<Issue> searchIssuesByParam(Map<String, Object> param) {
		return sqlSession.selectList("issues.searchIssuesByParam", param);
	}
	
	public List<Comment> getCommentByIno(int ino) {
		return sqlSession.selectList("issues.getCommentByIno", ino);
	}
	
	public void saveComment(Map<String, Object> param) {
		sqlSession.insert("issues.saveComment", param);
	}
	
	public void updateComment(Map<String, Object> param) {
		sqlSession.update("issues.updateComment", param);
	}
	
	public void removeCommentByCno(int cno) {
		sqlSession.delete("issues.removeCommentByCno", cno);
	}
	
	public void deleteFileList(int ino) {
		sqlSession.update("issues.deleteFileList", ino);
	}
	
	public void updateFile(Map<String, Object> param) {
		sqlSession.update("issues.updateFile", param);
	}

	public String getPnameByPno(int pno) {
		return sqlSession.selectOne("issues.getPnameByPno", pno);
	}
	
	public void updateAssigneeByIno(Map<String, Object> param) {
		sqlSession.update("issues.updateAssigneeByIno", param);
	}
	
	public void updateMilestoneByIno(Map<String, Object> param) {
		sqlSession.update("issues.updateMilestoneByIno", param);
	}
	
	public int getIssueCnt(Map<String, Object> param) {
		return sqlSession.selectOne("issues.getIssueCnt", param);
	}
	
	public List<Map<String, Object>> getIssueDataByUno(Map<String, Object> param) {
		return sqlSession.selectList("issues.getIssueDataByUno", param);
	}
	
	public List<Map<String, Object>> getIssueDataByPno(Map<String, Object> param) {
		return sqlSession.selectList("issues.getIssueDataByPno", param);
	}
}