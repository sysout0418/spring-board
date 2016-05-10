package com.nbreds.projectPlanning.common.mail.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nbreds.projectPlanning.common.VO.Email;
import com.nbreds.projectPlanning.common.mail.EmailSender;

@Controller
@RequestMapping("/email")
public class EmailController {
	@Autowired
    private EmailSender emailSender;
    
    @RequestMapping("/send")
    public ModelAndView sendEmailAction () throws Exception {
 
        Email email = new Email();
         
        String reciver = "parkbusim@lenaparkmusic.com"; //받을사람의 이메일입니다.
        String subject = "이메일 제목";
        String content = "이메일 내용입니다.";
         
        email.setReciver(reciver);
        email.setSubject(subject);
        email.setContent(content);
        emailSender.SendEmail(email);
         
        return new ModelAndView("success");
    }
}