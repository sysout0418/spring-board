package com.nbreds.projectPlanning.milestones.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.issues.VO.Issues;
import com.nbreds.projectPlanning.milestones.VO.Milestones;

@Service
public interface MilestonesService {
	static final Logger logger = LoggerFactory.getLogger(MilestonesService.class);
	
	public void saveMilestone(Milestones milestone);

	public List<Milestones> getMilestonesByPno(HashMap<String, Object> param);

	public Milestones getMilestoneBymno(int mno);
	
	public void editMilestoneBymno(Milestones milestone);
	
	public void removeMilestone(int mno);

	public void closeMilestone(int mno);

	public void reopenMilestone(int mno);

	public List<Milestones> getJoinMilestones(HashMap<String, Object> param);

	public String getPnameByPno(int pno);

	public String getUnameByUno(String uno);

	public int countIssuesByMno(int mno);

	public int countClosedIssueByMno(int mno);

	public List<Issues> getIssuesBymno(int mno);
	
	public int countOpenIssuesByMno(int mno);

	public void editIssueByIno(HashMap<String, Object> param);
}
