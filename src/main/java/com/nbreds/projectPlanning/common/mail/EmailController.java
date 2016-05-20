package com.nbreds.projectPlanning.common.mail;
import java.util.HashMap;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nbreds.projectPlanning.common.VO.Email;
import com.nbreds.projectPlanning.common.mail.Service.EmailService;
import com.nbreds.projectPlanning.login.Service.ShaEncoder;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
    private EmailSender emailSender;
    
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private ShaEncoder encoder;
	
    @RequestMapping("/send")
    public String sendEmailAction (String address) throws Exception {
    	String password = temporaryPassword(10);
    	HashMap<String, String> param = new HashMap<>();
    	param.put("email", address);
    	param.put("password", encoder.encoding(password));
    	
    	if(emailService.editPassword(param) > 0){
    		Email email = new Email();
	        
	        String subject = "임시 비밀번호입니다.";
	        String content = "임시 비밀번호는 "+password+"입니다.";
	        
	        //email.setReciver(address);
	        email.setReciver("hyoin123@nate.com");
	        email.setSubject(subject);
	        email.setContent(content);
	        emailSender.SendEmail(email);
    	}
         
        return "redirect:/";
    }
    
    public static String temporaryPassword(int size) {
    	StringBuffer buffer = new StringBuffer();
    	Random random = new Random();
    			
    	String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
    			
    	for (int i = 0; i < size; i++) {
    		buffer.append(chars[random.nextInt(chars.length)]);
    	}
    	return buffer.toString();
    }
}