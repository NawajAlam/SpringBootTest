package com.nt.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nt.emailservice.EmailService;
import com.nt.model.User;
import com.nt.repo.UserRepo;

@Controller
public class ForgotController {

	@Autowired
	public UserRepo repo;
	@Autowired
	public EmailService service;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@GetMapping("/forgot")
	public String openEmaiForm() {
		return "forgot_email_form";
	}
	
	@PostMapping("/send-otp")
	public String sendOTP(@RequestParam("email")String email,HttpSession session) {
		System.out.println("Email:: "+email);
		//generate otp
		Random random=new Random();
		int otp = random.nextInt(99999);
		
		String body="OTP-"+otp;
		System.out.println("Random:: "+otp);
		boolean flag = service.sendMailMessage(email,"OTP From SCM" , body);
		
		if(flag) {
			System.out.println("Success");
			session.setAttribute("myotp", otp);
			session.setAttribute("email", email);
			return "verify_otp";
		}else {
			session.setAttribute("message", "Check your email id");
			return "forgot_email_form";
		}
	}
		//verify otp
		@PostMapping("/verify-otp")
		public String verifyOTP(@RequestParam("otp")int otp,HttpSession session) {
			int myotp=(int) session.getAttribute("myotp");
			String email=(String) session.getAttribute("email");
			if(myotp==otp) {
				//password change form
				User user = repo.getUserByUserName(email);
				if(user==null) {
					//send error message
					session.setAttribute("message", "User does not exist with this email");
					return "forgot_email_form";
				}else {
					//send password form
				}
				return "password_change_form";
			}else {
				session.setAttribute("message", "Please enter valid OTP !!");
				return "verify_otp";
			}
			
		}
		@PostMapping("/change-password")
		public String changePassword(@RequestParam("newpassword")String newpassword,HttpSession session) {
			String email=(String) session.getAttribute("email");
			User user = repo.getUserByUserName(email);
			user.setPassword(encoder.encode(newpassword));
			repo.save(user);
			return "redirect:/signin?change=password change successfully";
		}
		
	
}
