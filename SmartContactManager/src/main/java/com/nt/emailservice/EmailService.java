package com.nt.emailservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	@Autowired
	public JavaMailSender sender;
	public boolean sendMailMessage(String to, String subject,String body) {
		boolean flag=false;
		try {
			SimpleMailMessage message=new SimpleMailMessage();
			message.setFrom("nawajalam786.na@gmail.com");
			message.setTo(to);
			message.setText(body);
			message.setSubject(subject);
			
			sender.send(message);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
