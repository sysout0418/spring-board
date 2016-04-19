package com.nbreds.projectPlanning.admin.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.VO.CodeTable;
import com.nbreds.projectPlanning.common.VO.User;

@Service
public interface AdminService {
	static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	/** 모든 유저 수 카운트 */
	int countAllUser();
	
	/** 신규 유저 리스트 가져오기 */
	List<User> selectNewUser();
	
	/** 모든 유저 리스트 가져오기 */
	List<User> selectAllUser();
	
	/** 부서 한글화를 위해서 CodeTable에서 CODE_NAME 가져오기 */
	List<CodeTable> getDepartmentList(String codeType);
}
