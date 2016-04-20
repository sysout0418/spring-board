package com.nbreds.projectPlanning.Project.myProjects.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("MyProjectDao")
public class MyProjectDao {
	private static final Logger logger = LoggerFactory.getLogger(MyProjectDao.class);	

	@Autowired
	private SqlSession sqlSession;

	public List<Project> getProjectByUno(String uno) {
		return sqlSession.selectList("project.my.getProjectByUno", uno);
	}
	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.my.getUserForNo", uno);
	}
	public Project getProjectByPno(int pno) {
		return sqlSession.selectOne("project.my.getProjectByPno", pno);
	}
	public List<Project> searchProject(HashMap<String, Object> param) {
		return sqlSession.selectList("project.my.searchProject", param);
	}
	public List<HashMap<String, Object>> getRequestMember(int pno) {
		return sqlSession.selectList("project.my.getRequestMember", pno);
	}
	
	public int getParticipateUserCnt(int pno) {
		return sqlSession.selectOne("project.my.getParticipateUserCnt", pno);
	}
}