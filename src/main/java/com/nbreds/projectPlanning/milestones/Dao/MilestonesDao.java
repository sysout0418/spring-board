package com.nbreds.projectPlanning.milestones.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Repository("MilestonesDao")
public class MilestonesDao {
	private static final Logger logger = LoggerFactory.getLogger(MilestonesDao.class);	
	
	@Autowired
	private SqlSession sqlSession;

	public void saveMilestone(Milestone milestone) {
		sqlSession.insert("milestones.saveMilestone", milestone);
	}

	public List<Milestone> getMilestonesByPno(HashMap<String, Object> param) {
		return sqlSession.selectList("milestones.getMilestonesByPno", param);
	}

	public Milestone getMilestoneBymno(int mno) {
		return sqlSession.selectOne("milestones.getMilestoneBymno", mno);
	}

	public void editMilestoneBymno(Milestone milestone) {
		sqlSession.update("milestones.editMilestoneBymno", milestone);
	}

	public void removeMilestone(int mno) {
		sqlSession.update("milestones.removeMilestone", mno);
	}

	public void closeMilestone(int mno) {
		sqlSession.update("milestones.closeMilestone", mno);
	}

	public void reopenMilestone(int mno) {
		sqlSession.update("milestones.reopenMilestone", mno);
	}

	public List<Milestone> getJoinMilestones(HashMap<String, Object> param) {
		return sqlSession.selectList("milestones.getJoinMilestones", param);
	}

	public String getPnameByPno(int pno) {
		return sqlSession.selectOne("milestones.getPnameByPno", pno);
	}

	public String getUnameByUno(String uno) {
		return sqlSession.selectOne("milestones.getUnameByUno", uno);
	}

	public int countIssuesByMno(int mno) {
		return sqlSession.selectOne("milestones.countIssuesByMno", mno);
	}

	public int countClosedIssueByMno(int mno) {
		return sqlSession.selectOne("milestones.countClosedIssueByMno", mno);
	}

	public List<Issue> getIssuesBymno(int mno) {
		return sqlSession.selectList("milestones.getIssuesBymno", mno);
	}

	public int countOpenIssuesByMno(int mno) {
		return sqlSession.selectOne("milestones.countOpenIssuesByMno", mno);
	}

	public void editIssueByIno(HashMap<String, Object> param) {
		sqlSession.update("milestones.editIssueByIno", param);
	}

	public int getLastMno() {
		return sqlSession.selectOne("milestones.getLastMno");
	}

	public void saveMilestoneFile(Map<String, Object> param) {
		sqlSession.insert("milestones.saveMilestoneFile", param);
	}

	public List<Files> getFileListByMno(int mno) {
		return sqlSession.selectList("milestones.getFileListByMno", mno);
	}
	
	// Files 테이블의 컬럼 isDel을 Y로 바꾸는 메소드
	public void deleteFileList(int mno) {
		sqlSession.update("milestones.deleteFileList", mno);
	}
	
	// Files 테이블 update
	public void updateFile(Map<String, Object> param) {
		sqlSession.update("milestones.updateFile", param);
	}
	
	// 마일스톤 카운트
	public int getMilestoneCnt(Map<String, Object> param) {
		return sqlSession.selectOne("milestones.getMilestoneCnt", param);
	}
	
}