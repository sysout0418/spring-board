package com.nbreds.projectPlanning.Project.listProjects.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;
import com.nbreds.projectPlanning.issues.VO.Label;

@Repository("ListDao")
public class ListDao {
	private static final Logger logger = LoggerFactory.getLogger(ListDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public int count(){
		int count = 0;
		count = sqlSession.selectOne("project.list.getTotalProjectNo");
		
		return count;
	}
	
	public List<HashMap<String, Object>> getPageList(HashMap<String, Integer> param) {
		return sqlSession.selectList("project.list.getPageList", param);
	}
	public HashMap<String, Object> getProjectByPno(int pno) {
		return sqlSession.selectOne("project.list.getProjectByPno", pno);
	}
	public void removeProject(int pno) {
		sqlSession.delete("project.list.removeProject", pno);
	}

	public void updateProject(Project project) {
		sqlSession.update("project.list.updateProject", project);
	}
	
	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.list.getUserForNo", uno);
	}
	
	public int getParticipateUserCnt(int pno) {
		return sqlSession.selectOne("project.list.getParticipateUserCnt", pno);
	}
	
	public List<ProjectMemberStat> getParticipateUserListByPno(int pno) {
		return sqlSession.selectList("project.list.getParticipateUserListByPno", pno);
	}
	
	public List<ProjectMemberStat> getParticipateUserListByUno(int uno) {
		return sqlSession.selectList("project.list.getParticipateUserListByUno", uno);
	}
	
	public List<User> getAllUser() {
		return sqlSession.selectList("project.list.getAllUser");
	}
	
	public void deleteMSByUno(int uno) {
		sqlSession.delete("project.list.deleteMSByUno", uno);
	}
	
	public void deleteMSByPno(int pno) {
		sqlSession.delete("project.list.deleteMSByPno", pno);
	}
	
	public void saveProjectMS(ProjectMemberStat projectMS) {
		sqlSession.insert("project.list.saveProjectMS", projectMS);
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return sqlSession.selectList("project.list.getCodeTable", CODE_TYPE);
	}
	public List<User> getUsersForName(String uname) {
		return sqlSession.selectList("project.list.getUsersForName", uname);
	}

	public int getCountAllMilestone(int pno) {
		return sqlSession.selectOne("project.list.getCountAllMilestone", pno);
	}
	public double getCountClosedMilestone(int pno) {
		return sqlSession.selectOne("project.list.getCountClosedMilestone", pno);
	}
	public void setRownum() {
		sqlSession.selectOne("project.list.setRownum");
	}

	public List<HashMap<String, Object>> getRequestMember(int pno) {
		return sqlSession.selectList("project.list.getRequestMember", pno);
	}

	public List<HashMap<String, Object>> getActivityByPno(int pno) {
		return sqlSession.selectList("project.list.getActivityByPno", pno);
	}

	public int getcountAllIssue(int pno) {
		return sqlSession.selectOne("project.list.getCountAllIssue", pno);
	}

	public Project getUpdateProjectByPno(int pno) {
		return sqlSession.selectOne("project.list.getUpdateProjectByPno", pno);
	}
	
	public List<Label> getAllLabel() {
		return sqlSession.selectList("project.list.getAllLabel");
	}

	public List<HashMap<String, Object>> getParticipateUsers(int pno) {
		return sqlSession.selectList("project.list.getParticipateUsers", pno);
	}

	public void deleteMS(HashMap<String, Object> param) {
		sqlSession.delete("project.list.deleteMS", param);
	}

	public String getEmailByUno(int uno) {
		return sqlSession.selectOne("project.list.getEmailByUno", uno);
	}

	public void deleteMSAll(int pno) {
		sqlSession.delete("project.list.deleteMSAll", pno);
	}
}