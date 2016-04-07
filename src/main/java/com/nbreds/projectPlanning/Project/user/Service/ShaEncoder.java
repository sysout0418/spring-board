package com.nbreds.projectPlanning.Project.user.Service;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @author nbreds
 * 회원가입시 패스워드 암호화 할 때 사용하는 class
 */
@Service("shaEncoder")
public class ShaEncoder {
	
	@Resource(name="passwordEncoder")
	private ShaPasswordEncoder encoder;
	
	public String encoding(String str){
		return encoder.encodePassword(str,null);
	}

	public String saltEncoding(String str,String salt){
		return encoder.encodePassword(str,salt);
	}
}
