package com.nbreds.projectPlanning.admin.Service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.Project.VO.Project;
import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface AdminService {
	static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	List<Project> get5Projects();

	List<User> get5Users();

	int getCountUsers();

	int getCountProjects();

	List<Project> getAllProjects(Map<String, Object> param);

	int totalProjectCount(Map<String, Object> param);
	
	void removeProjects(int i);
	
	/** 회원 탈퇴 처리 -> User 테이블 expired 컬럼값 N에서 Y로 update */
	void removeUsersByUno(int uno);
	
	/** 회원 복구 처리 -> User 테이블 expired 컬럼값 N으로 update */
	void recoverUsersByUno(int uno);
	
	/** 회원 가입 승인 처리 -> Authority 테이블 enabled 컬럼값 1으로 update */
	void admitUserByUno(int uno);
	
	/** 회원 가입 거절 처리 -> Authority 테이블 enabled 컬럼값 0으로 update */
	void denyUserByUno(int uno);
	
	/** 모든 유저 리스트 가져오기 */
	List<User> selectAllUser(Map<String, Object> param);
	
	/** 페이징 처리를 위한 유저 카운트 */
	int totalUserCount(Map<String, Object> param);
	
	/** 부서 한글화를 위해서 CodeTable에서 CODE_NAME 가져오기 */
	List<CodeTable> getDepartmentList(String codeType);

	List<Project> getProjectsByPname(String item);

<<<<<<< HEAD
	List<Project> getProjectsByUname(String item);
	
	/** uno로 유저 정보 가져오기 */
	User getUserInfoByUno(int uno);
=======
	List<Project> getProjectsByUname(String item);
>>>>>>> branch 'master' of http://gitlab.nbreds.com:30000/sangil/Web.git
}
