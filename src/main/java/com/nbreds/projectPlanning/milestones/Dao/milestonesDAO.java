package com.nbreds.projectPlanning.milestones.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Repository
public class milestonesDAO {
	@Autowired
	private SqlSession sqlSession;

	public void saveMilestone(Milestones milestone) {
		sqlSession.insert("milestones.saveMilestone", milestone);
	}

	public List<Milestones> getMilestonesByPno(HashMap<String, Object> param) {
		return sqlSession.selectList("milestones.getMilestonesByPno", param);
	}

	public Milestones getMilestoneBymno(int mno) {
		return sqlSession.selectOne("milestones.getMilestoneBymno", mno);
	}

	public void editMilestoneBymno(Milestones milestone) {
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

	public List<String> getJoinMilestones(HashMap<String, Object> param) {
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

	public int countCompleteIssueByMno(int mno) {
		return sqlSession.selectOne("milestones.countCompleteIssueByMno", mno);
	}
}