package com.nbreds.projectPlanning.common.mail.Service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nbreds.projectPlanning.common.mail.Dao.EmailDao;


@Service("EmailService")
public class EmailServiceImpl implements EmailService {
	public static final Logger logger = LoggerFactory.getLogger(EmailServiceImpl.class);
	
	@Autowired
	EmailDao emailDao;

	@Override
	public int editPassword(HashMap<String, String> param) {
		return emailDao.editPassword(param);
	}
}