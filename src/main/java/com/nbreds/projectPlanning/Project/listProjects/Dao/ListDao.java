package com.nbreds.projectPlanning.Project.listProjects.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.util.CodeTable;
import com.nbreds.projectPlanning.common.util.User;

@Repository("ListDao")
public class ListDao {
	private static final Logger logger = LoggerFactory.getLogger(ListDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public int count(){
		int count = 0;
		count = sqlSession.selectOne("project.getTotalProjectNo");
		
		return count;
	}
	
	public List<Project> getPageList(HashMap<String, Integer> param) {
		return sqlSession.selectList("project.getProjectList", param);
	}
	public Project getProjectByPno(int pno) {
		return sqlSession.selectOne("project.getProjectByPno", pno);
	}
	public void removeProject(int pno) {
		sqlSession.delete("project.removeProject", pno);
	}
	public CodeTable getCodeName(HashMap<String, String> param) {
		return sqlSession.selectOne("project.getCodeName", param);
	}
	public void updateProject(Project project) {
		sqlSession.update("project.updateProject", project);
	}
	
	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.getUserForNo", uno);
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return sqlSession.selectList("project.getCodeTable", CODE_TYPE);
	}
	public List<User> getUsersForName(String uname) {
		return sqlSession.selectList("project.getUsersForName", uname);
	}
}
