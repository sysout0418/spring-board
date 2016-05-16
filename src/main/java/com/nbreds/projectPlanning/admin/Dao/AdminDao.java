package com.nbreds.projectPlanning.admin.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.Authority;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Repository("AdminDao")
public class AdminDao {
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<HashMap<String, Object>> get5Projects() {
		return sqlSession.selectList("admin.get5Projects");
	}

	public List<HashMap<String, Object>> get5Users() {
		return sqlSession.selectList("admin.get5Users");
	}

	public int getCountUsers() {
		return sqlSession.selectOne("admin.getCountUsers");
	}

	public int getCountProjects() {
		return sqlSession.selectOne("admin.getCountProjects");
	}

	public List<Project> getAllProjects(Map<String, Object> param) {
		return sqlSession.selectList("admin.getAllProjects", param);
	}
	
	public int totalProjectCount(Map<String, Object> param) {
		return sqlSession.selectOne("admin.totalProjectCount", param);
	}

	public void removeProjects(int i) {
		sqlSession.delete("admin.removeProjects", i);
	}
	
	public void removeUsersByUno(int uno) {
		sqlSession.update("admin.removeUsersByUno", uno);
	}
	
	public void recoverUsersByUno(int uno) {
		sqlSession.update("admin.recoverUsersByUno",uno);
	}
	
	public void admitUserByUno(int uno) {
		sqlSession.update("admin.admitUserByUno", uno);
	}
	
	public void denyUserByUno(int uno) {
		sqlSession.update("admin.denyUserByUno", uno);
	}
	
	public List<User> selectAllUser(Map<String, Object> param) {
		return sqlSession.selectList("admin.selectAllUser", param);
	}

	public int totalUserCount(Map<String, Object> param) {
		return sqlSession.selectOne("admin.totalUserCount", param);
	}
	
	public List<CodeTable> getDepartmentList(String codeType) {
		return sqlSession.selectList("admin.getDepartmentList", codeType);
	}

	public List<Project> getProjectsByPname(String item) {
		return sqlSession.selectList("admin.getProjectsByPname", item);
	}

	public List<Project> getProjectsByUname(String item) {
		return sqlSession.selectList("admin.getProjectsByUname", item);
	}
	
	public User getUserInfoByUno(int uno) {
		return sqlSession.selectOne("admin.getUserInfoByUno", uno);
	}
	
	public List<Authority> getAllAuthority() {
		return sqlSession.selectList("admin.getAllAuthority");
	}
	
	public List<CodeTable> getAllDepartmentList() {
		return sqlSession.selectList("admin.getAllDepartmentList");
	}
	
	public void setRownum1() {
		sqlSession.selectOne("admin.setRownum1");
	}	
	
	public void setRownum2() {
		sqlSession.selectOne("admin.setRownum2");
	}
	
	public void updateUserInfo(Map<String, Object> param) {
		sqlSession.update("admin.updateUserInfo", param);
	}
	
	public void updateUserAuthorityAndAdmit(Map<String, Object> param) {
		sqlSession.update("admin.updateUserAuthorityAndAdmit", param);
	}
	
	public List<Map<String, Object>> getAllLabel() {
		return sqlSession.selectList("admin.getAllLabel");
	}
	
	public void saveLabel(Map<String, Object> param) {
		sqlSession.insert("admin.saveLabel", param);
	}
	
	public void updateLabel(Map<String, Object> param) {
		sqlSession.update("admin.updateLabel", param);
	}
	
	public void deleteLabel(int lno) {
		sqlSession.delete("admin.deleteLabel", lno);
	}
	
	public Map<String, Object> getAuthorityByUno(int uno) {
		return sqlSession.selectOne("admin.getAuthorityByUno", uno);
	}
	
}