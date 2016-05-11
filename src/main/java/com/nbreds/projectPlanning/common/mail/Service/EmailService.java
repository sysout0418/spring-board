package com.nbreds.projectPlanning.common.mail.Service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public interface EmailService {
	public static final Logger logger = LoggerFactory.getLogger(EmailService.class);

	int editPassword(HashMap<String, String> param);
}
