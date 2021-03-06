package com.nbreds.projectPlanning.Project.registProject.Dao;

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

@Repository("RegistDao")
public class RegistDao {
	private static final Logger logger = LoggerFactory.getLogger(RegistDao.class);	

	@Autowired
	private SqlSession sqlSession;
	
	public void saveProject(Project project) {
		sqlSession.insert("project.regist.saveProject", project);
	}
	
	public void saveProjectMS(ProjectMemberStat projectMS) {
		sqlSession.insert("project.regist.saveProjectMS", projectMS);
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return sqlSession.selectList("project.regist.getCodeTable", CODE_TYPE);
	}

	public List<User> getUsersForName(String uname) {
		return sqlSession.selectList("project.regist.getUsersForName", uname);
	}

	public HashMap<String, Object> getUserForNo(int uno) {
		return sqlSession.selectOne("project.regist.getUserForNo", uno);
	}
	
	public List<User> getAllUser() {
		return sqlSession.selectList("project.regist.getAllUser");
	}
	
	public List<Label> getAllLabel() {
		return sqlSession.selectList("project.regist.getAllLabel");
	}

	public String getEmailByUno(int uno) {
		return sqlSession.selectOne("project.regist.getEmailByUno", uno);
	}
}