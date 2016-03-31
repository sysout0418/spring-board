package com.nbreds.projectPlanning.Project.myProjects.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.User;

@Repository
public class myProjectsDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<Project> getProjectByUno(String uno) {
		return sqlSession.selectList("project.getProjectByUno", uno);
	}
	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.getUserForNo", uno);
	}
	public Project getProjectByPno(int pno) {
		return sqlSession.selectOne("project.getProjectByPno", pno);
	}
	public CodeTable getCodeName(HashMap<String, String> param) {
		return sqlSession.selectOne("project.getCodeName", param);
	}
}
