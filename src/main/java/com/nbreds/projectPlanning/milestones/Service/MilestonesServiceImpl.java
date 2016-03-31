package com.nbreds.projectPlanning.milestones.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.Dao.MilestonesDao;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service("MilestonesService")
public class MilestonesServiceImpl implements MilestonesService{
	private static final Logger logger = LoggerFactory.getLogger(MilestonesServiceImpl.class);
	
	@Autowired
	MilestonesDao milestonesdao;

	public void saveMilestone(Milestone milestone) {
		milestonesdao.saveMilestone(milestone);
	}

	public List<Milestone> getMilestonesByPno(HashMap<String, Object> param) {
		return milestonesdao.getMilestonesByPno(param);
	}

	public Milestone getMilestoneBymno(int mno) {
		return milestonesdao.getMilestoneBymno(mno);
	}

	public void editMilestoneBymno(Milestone milestone) {
		milestonesdao.editMilestoneBymno(milestone);
	}

	public void removeMilestone(int mno) {
		milestonesdao.removeMilestone(mno);
	}

	public void closeMilestone(int mno) {
		milestonesdao.closeMilestone(mno);
	}

	public void reopenMilestone(int mno) {
		milestonesdao.reopenMilestone(mno);
	}

	public List<Milestone> getJoinMilestones(HashMap<String, Object> param) {
		return milestonesdao.getJoinMilestones(param);
	}

	public String getPnameByPno(int pno) {
		return milestonesdao.getPnameByPno(pno);
	}

	public String getUnameByUno(String uno) {
		return milestonesdao.getUnameByUno(uno);
	}

	public int countIssuesByMno(int mno) {
		return milestonesdao.countIssuesByMno(mno);
	}

	public int countClosedIssueByMno(int mno) {
		return milestonesdao.countClosedIssueByMno(mno);
	}

	public List<Issue> getIssuesBymno(int mno) {
		return milestonesdao.getIssuesBymno(mno);
	}

	public int countOpenIssuesByMno(int mno) {
		return milestonesdao.countOpenIssuesByMno(mno);
	}

	public void editIssueByIno(HashMap<String, Object> param) {
		milestonesdao.editIssueByIno(param);
	}
}
