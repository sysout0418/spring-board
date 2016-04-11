package com.nbreds.projectPlanning.milestones.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.Files;
import com.nbreds.projectPlanning.common.util.FileUtils;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.milestones.Dao.MilestonesDao;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service("MilestonesService")
public class MilestonesServiceImpl implements MilestonesService{
	private static final Logger logger = LoggerFactory.getLogger(MilestonesServiceImpl.class);
	
	@Autowired
	MilestonesDao milestonesdao;
	
	@Autowired
	FileUtils fileUtils;

	@Override
	public void saveMilestone(Milestone milestone, HttpServletRequest request) {
		milestonesdao.saveMilestone(milestone);
		
		// 파일정보 DB에 INSERT
		List<Map<String, Object>> list;
		int lastMno = getLastMno();
		try {
			milestone.setMno(lastMno);
			list = fileUtils.parseInsertFileInfo(milestone, request);
			for (int i = 0; i < list.size(); i++) {
				saveMilestoneFile(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getLastMno() {
		return milestonesdao.getLastMno();
	}
	
	@Override
	public void saveMilestoneFile(Map<String, Object> param) {
		milestonesdao.saveMilestoneFile(param);
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

	@Override
	public List<Files> getFileListByMno(int mno) {
		return milestonesdao.getFileListByMno(mno);
	}
}