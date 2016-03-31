package com.nbreds.projectPlanning.milestones.Service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.milestones.Dao.MilestonesDao;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Service("MilestonesService")
public class MilestonesServiceImpl implements MilestonesService{
	private static final Logger logger = LoggerFactory.getLogger(MilestonesServiceImpl.class);
	
	@Resource(name="MilestonesDao")
	MilestonesDao milestonesdao;

	public void saveMilestone(Milestones milestone) {
		milestonesdao.saveMilestone(milestone);
	}

	public List<Milestones> getMilestonesByPno(HashMap<String, Object> param) {
		return milestonesdao.getMilestonesByPno(param);
	}

	public Milestones getMilestoneBymno(int mno) {
		return milestonesdao.getMilestoneBymno(mno);
	}

	public void editMilestoneBymno(Milestones milestone) {
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

	public List<Milestones> getJoinMilestones(HashMap<String, Object> param) {
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

	public List<Issues> getIssuesBymno(int mno) {
		return milestonesdao.getIssuesBymno(mno);
	}

	public int countOpenIssuesByMno(int mno) {
		return milestonesdao.countOpenIssuesByMno(mno);
	}

	public void editIssueByIno(HashMap<String, Object> param) {
		milestonesdao.editIssueByIno(param);
	}
}
