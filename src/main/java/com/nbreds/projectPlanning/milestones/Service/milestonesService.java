package com.nbreds.projectPlanning.milestones.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.milestones.Dao.milestonesDAO;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Service
public class milestonesService {
	@Autowired
	milestonesDAO milestonesdao;

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
