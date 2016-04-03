package com.nbreds.projectPlanning.issues.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.User;
import com.nbreds.projectPlanning.issueLabel.VO.IssueLabel;
import com.nbreds.projectPlanning.issues.VO.Comment;
import com.nbreds.projectPlanning.issues.VO.Issue;
import com.nbreds.projectPlanning.label.VO.Label;
import com.nbreds.projectPlanning.milestones.VO.Milestone;

@Service
public interface IssueService {
	static final Logger logger = LoggerFactory.getLogger(IssueServiceImpl.class);

	/** 이슈 정보 등록 */
	public void saveIssues(Issue issues);
	
	/** 모든 이슈 리스트 가져오기 */
	public List<Issue> getAllIssues();

	/** ino로 이슈 리스트 가져오기 */
	public Issue getIssuesByIno(int ino);

	/** pno로 이슈 리스트 가져오기*/
	public List<Issue> getIssuesByPno(Map<String, Object> param);
	
	/** param 조건에 따라 해당하는 Issue 검색 */
	public List<Issue> searchIssues(Map<String, Object> param);
	
	/** 모든 마일스톤 리스트 가져오는 기능 */
	public List<Milestone> getAllMilestone();
	
	/** ino로 이슈 업데이트 */
	public void updateIssueByIno(Issue issues);
	
	/** 이슈 삭제 기능 (지금은 안씀) */
	public void removeIssues(int ino);

	/** uno로 user 정보 가져오는 기능 */
	public User getUserForNo(int uno);
	
	/** issue close 기능 */
	public void closeIssue(Map<String, Object> param);

	/** 가장 최근에 insert 된 번호를 가져오는 기능 */
	public int getLastIno();
	
	/** 모든 label 리스트 가져오는 기능 */
	public List<Label> getAllLabel();
	
	/** 모든 유저 리스트 가져오는 기능 */
	public List<User> getAllUserNameAndNo();
	
	/** ino에 붙어있는 모든 label 가져오는 기능 */
	public List<Label> getLabelsByIno(int ino);
	
	/** IssueLabel 테이블에 ino, lno 등록하는 기능 */
	public void saveIssueLabel(IssueLabel issueLabel);
	
	/** 업데이트를 위해서 IssueLabel 테이블 데이터 한번 지우는 기능 */
	public void removeIssueLabelForUpdate(Issue issues);
	
	/** uno로 이슈 가져오는 기능 */
	public List<Issue> getIssuesByUno(Map<String, Object> param);

	/** 들어온 param에 따라 이슈 검색하는 기능 */
	public List<Issue> searchIssuesByParam(Map<String, Object> param);
	
	/** ino로 코멘트 리스트 가져오는 기능 */
	public List<Comment> getCommentByIno(int ino);
	
	/** 코멘트 등록 기능 */
	public void saveComment(Map<String, Object> map);
	
	/** 코멘트 업뎃 기능 */
	public void updateComment(Map<String, Object> map);
	
	/** 코멘드 삭제 기능 */
	public void removeCommentByCno(int cno);
}
