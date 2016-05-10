package com.nbreds.projectPlanning.common.mail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nbreds.projectPlanning.common.VO.Email;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
    private EmailSender emailSender;
    
    @RequestMapping("/send")
    public String sendEmailAction (String address) throws Exception {
 
        Email email = new Email();
        
        String subject = "이메일 제목";
        String content = "이메일 내용입니다.";
        
        email.setReciver(address);
        email.setSubject(subject);
        email.setContent(content);
        emailSender.SendEmail(email);
         
        return "login/loginForm";
    }
}