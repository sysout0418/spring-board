package com.nbreds.projectPlanning.milestones.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service
public interface MilestonesService {
	static final Logger logger = LoggerFactory.getLogger(MilestonesService.class);
	
	public void saveMilestone(Milestone milestone, HttpServletRequest request);

	public List<Milestone> getMilestonesByPno(HashMap<String, Object> param);

	public Milestone getMilestoneBymno(int mno);
	
	public void editMilestoneBymno(Milestone milestone, HttpServletRequest request);
	
	public void removeMilestone(int mno);

	public void closeMilestone(int mno);

	public void reopenMilestone(int mno);

	public List<Milestone> getJoinMilestones(HashMap<String, Object> param);

	public String getPnameByPno(int pno);

	public String getUnameByUno(String uno);

	public int countIssuesByMno(int mno);

	public int countClosedIssueByMno(int mno);

	public List<Issue> getIssuesBymno(int mno);
	
	public int countOpenIssuesByMno(int mno);

	public void editIssueByIno(HashMap<String, Object> param);
	
	void saveMilestoneFile(Map<String, Object> param);

	public List<Files> getFileListByMno(int mno);
	
	void deleteFileList(int mno);
	
	void updateFile(Map<String, Object> param);
	
	int getMilestoneCnt(Map<String, Object> param);

	public List<HashMap<String, Object>> getMilestonesData(HashMap<String, String> param);
}
