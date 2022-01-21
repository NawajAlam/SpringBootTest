package com.nt.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nt.helper.Message;
import com.nt.model.User;
import com.nt.repo.UserRepo;

@Controller
public class HomeController {

	@Autowired
	private BCryptPasswordEncoder pEncoder;
	
	@Autowired
	private UserRepo repo;
	@GetMapping("/")
	public String home(Model m) {
		m.addAttribute("title", "Home Smart Contact Manager");
		return "home";
	}
	
	@GetMapping("/about")
	public String about(Model m) {
		m.addAttribute("title", "About Smart Contact Manager");
		return "about";
	}
	
	@GetMapping("signup")
	public String signup(Model m) {
		m.addAttribute("title", "Register Smart Contact Manager");
		m.addAttribute("user", new User());
		return "signup";
	}
	@PostMapping("signup")
	public String register(@Valid @ModelAttribute("user") User user,BindingResult result, @RequestParam(value="agreement",defaultValue="false")boolean agreement,Model m,HttpSession session) {
		
		try {
			if(result.hasErrors()) {
				return "signup";
			}
			if(!agreement) {
				throw new Exception("You have not agree terms and condition");
			}
			user.setRole("ROLE_USER");
			user.setImageUrl("default.jpg");
			user.setEnabled(true);
			user.setPassword(pEncoder.encode(user.getPassword()));
			//System.out.println("Agreement "+agreement);
			System.out.println("User "+user);
			
			
			 repo.save(user);
			m.addAttribute("user", new User());
			session.setAttribute("message", new Message("Successfully Registered !! ","alert-success"));
		}catch(DataIntegrityViolationException ex) {
			m.addAttribute("user", user);
			session.setAttribute("message", new Message("Email is already exist!! ","alert-danger"));
		}
		
		catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("user", user);
			session.setAttribute("message", new Message("Something went Wrong !! "+e.getMessage(),"alert-danger"));
		}
		return "signup";
	}
	
	@GetMapping("signin")
	public String custom_login(Model m) {
		m.addAttribute("title", "Login Smart Contact Manager");
		return "login";
	}
	
	
}
