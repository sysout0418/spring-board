package com.nbreds.projectPlanning.Project.registProject.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.CodeTable;
import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.Project.VO.ProjectMemberStat;
import com.nbreds.projectPlanning.Project.VO.User;

@Repository
public class RegistDAO {
	@Autowired
	private SqlSession sqlSession;

	public void saveManager(HashMap<String, String> manager) {
		sqlSession.insert("project.saveManager", manager);
	}

	public void saveProject(Project project) {
		sqlSession.insert("project.saveProject", project);
	}
	
	public void saveProjectMS(ProjectMemberStat projectMS) {
		sqlSession.insert("project.saveProjectMS", projectMS);
	}
	
//	public void saveProject(Project project, ProjectMemberStat projectMS) {
//		sqlSession.insert("project.saveProject", project);
//		
//		// 프로젝트 등록하는 순간이 최근 프로젝트이므로 최신 pno 가져와서 세팅..
//		int maxPno = getMaxPno();
//		projectMS.setPno(maxPno);
//		// 임시로 stat 셋팅
//		projectMS.setStat("000");
//		String uno = project.getPmember();
//		String[] unos = uno.split(",");
//		for (int i = 0; i < unos.length; i++) {
//			projectMS.setUno(Integer.parseInt(unos[i]));
//			sqlSession.insert("project.saveProjectMS", projectMS);
//		}
//	}

	public int getLastno() {
		return sqlSession.selectOne("project.getLastno");
	}
	
	public List<CodeTable> getCodeTable(String CODE_TYPE) {
		return sqlSession.selectList("project.getCodeTable", CODE_TYPE);
	}

	public List<User> getUsersForName(String uname) {
		return sqlSession.selectList("project.getUsersForName", uname);
	}

	public User getUserForNo(int uno) {
		return sqlSession.selectOne("project.getUserForNo", uno);
	}
	
	// 03-22 추가
	// 모든 유저의 이름과 유저 번호 가져옴
	public List<User> getAllUserNameAndNo() {
		return sqlSession.selectList("project.getAllUserNameAndNo");
	}
	
}
