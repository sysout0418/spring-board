package com.nbreds.projectPlanning.milestones.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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
	
	// 파일 정보를 담고 있는 list
	List<Map<String, Object>> list;

	@Override
	@Transactional
	public void saveMilestone(Milestone milestone, HttpServletRequest request) {
		try {
			milestonesdao.saveMilestone(milestone);
			
			// 파일정보 DB에 INSERT
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			int lastMno = getLastMno();
			milestone.setMno(lastMno);
			list = fileUtils.parseInsertFileInfo(milestone, request);
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					saveMilestoneFile(list.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	private int getLastMno() {
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

	@Transactional
	public void editMilestoneBymno(Milestone milestone, HttpServletRequest request) {
		try {
			// 마일스톤 정보 업뎃
			milestonesdao.editMilestoneBymno(milestone);

			// Files 테이블의 isDel 컬럼값을 조건 ino이용하여 Y로 변경
			deleteFileList(milestone.getMno());

			// 파일정보 업뎃
			List<Map<String, Object>> list;
			list = fileUtils.parseUpdateFileInfo(milestone, request);
			Map<String, Object> param = null;
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					param = list.get(i);
					if (param.get("IS_NEW").equals("Y")) {
						saveMilestoneFile(param);
					} else {
						updateFile(param);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
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

	@Override
	public void deleteFileList(int mno) {
		milestonesdao.deleteFileList(mno);
	}

	@Override
	public void updateFile(Map<String, Object> param) {
		milestonesdao.updateFile(param);
	}

	@Override
	public int getMilestoneCnt(Map<String, Object> param) {
		return milestonesdao.getMilestoneCnt(param);
	}

}