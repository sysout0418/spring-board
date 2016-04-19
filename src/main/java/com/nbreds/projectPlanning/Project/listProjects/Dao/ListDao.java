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
	
	public List<Project> getPageList(HashMap<String, Integer> param) {
		return sqlSession.selectList("project.list.getProjectList", param);
	}
	public Project getProjectByPno(int pno) {
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
	
	public List<ProjectMemberStat> getParticipateUserList(int pno) {
		return sqlSession.selectList("project.list.getParticipateUserList", pno);
	}
	
	public List<User> getAllUser() {
		return sqlSession.selectList("project.list.getAllUser");
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return sqlSession.selectList("project.list.getCodeTable", CODE_TYPE);
	}
	public List<User> getUsersForName(String uname) {
		return sqlSession.selectList("project.list.getUsersForName", uname);
	}
}