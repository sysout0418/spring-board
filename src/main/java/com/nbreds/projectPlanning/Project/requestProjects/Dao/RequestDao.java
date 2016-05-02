package com.nbreds.projectPlanning.Project.requestProjects.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Repository("RequestDao")
public class RequestDao {
	private static final Logger logger = LoggerFactory.getLogger(RequestDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<HashMap<String, Object>> getRequestProjects(HashMap<String, Object> param) {
		return sqlSession.selectList("project.request.getRequestProjects", param);
	}
	public void updateStat(HashMap<String, Object> param) {
		sqlSession.update("project.request.updateStat", param);
	}
	public int getCountRequestProjects(String uno) {
		return sqlSession.selectOne("project.request.getCountRequestProjects", uno);
	}
	public List<HashMap<String, Object>> getMilestonesByUno(String uno) {
		return sqlSession.selectList("project.request.getMilestonesByUno", uno);
	}
	public List<HashMap<String, Object>> getMessagesByUno(String uno) {
		return sqlSession.selectList("project.request.getMessagesByUno", uno);
	}
	public int countIssuesByMno(int mno) {
		return sqlSession.selectOne("project.request.countIssuesByMno", mno);
	}
	public double countClosedIssueByMno(int mno) {
		return sqlSession.selectOne("project.request.countClosedIssueByMno", mno);
	}
	public void setRownum() {
		sqlSession.selectOne("project.request.setRownum");
	}
	public int getCountAllMilestone(int pno) {
		return sqlSession.selectOne("project.request.getCountAllMilestone", pno);
	}
	public double getCountClosedMilestone(int pno) {
		return sqlSession.selectOne("project.request.getCountClosedMilestone", pno);
	}
}