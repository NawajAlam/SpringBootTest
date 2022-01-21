package com.nt.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nt.helper.Message;
import com.nt.model.Contact;
import com.nt.model.User;
import com.nt.repo.ContactRepo;
import com.nt.repo.UserRepo;

@Controller
@RequestMapping("/user")
public class UserController {


	@Autowired
	private UserRepo repo;
	@Autowired
	private ContactRepo crepo;

	//adding common data
	@ModelAttribute
	public void addCommonData(Model m,Principal p) {
		String name=p.getName();
		System.out.println("User Name "+name);
		//get user from username      
		User userByUserName = repo.getUserByUserName(name);

		m.addAttribute("user", userByUserName);
	}
	@GetMapping("/about")
	public String about(Model m) {
		m.addAttribute("title", "About Smart Contact Manager");
		return "normal/about";
	}

	@GetMapping("/index")
	public String dashboard(Model m,Principal p) {
		m.addAttribute("title", "Home-Smart Contact Manager");
		return "normal/user_dashboard";
	}

	//open add form handler
	@GetMapping("/add")
	public String openAddContactForm(Model m,@ModelAttribute("contact")Contact contact) {
		m.addAttribute("title", "Add Contact");
		m.addAttribute("contact", new Contact());
		return "normal/add_contact";
	}

	@PostMapping("/add")
	public String saveContact(@Valid @ModelAttribute("contact")Contact contact ,BindingResult result
			,@RequestParam("imageProfile")MultipartFile file, Principal p,HttpSession session) {
		try {
			if(result.hasErrors())
			{
				return "normal/add_contact";
			}
			
			String name = p.getName();
			User user = repo.getUserByUserName(name);
			contact.setUser(user);
			user.getContacts().add(contact);


			//processing and uploading file
			if(file.isEmpty()) {
				System.out.println("File is empty");
				contact.setImage("contact.png");
			}
			else {
				//upload file 
				contact.setImage(file.getOriginalFilename());
				File f = new ClassPathResource("static/images").getFile();
				Path path = Paths.get(f.getAbsolutePath()+File.separator+file.getOriginalFilename());
				Files.copy(file.getInputStream(),path , StandardCopyOption.REPLACE_EXISTING);
				System.out.println("image is uploaded");
			}
			repo.save(user);
			System.out.println("Contact Data "+contact);
			//message success
			session.setAttribute("message", new Message("Your Contact is added !! Add more..","primary"));

		}catch (Exception e) {
			System.out.println("Error :"+e.getMessage());
			//error message
			session.setAttribute("message", new Message("Something went wrong !! Please try again.."+e.getMessage(),"danger"));
		}
		return "normal/add_contact";
	}

	//view contact
	//pagination
	@GetMapping("/show/{page}")
	public String view_contact(@PathVariable("page")Integer page, Model m,Principal p) {
		m.addAttribute("title", "Show Contact-Smart Contact Manager");
		/*String name = p.getName();
		User user = repo.getUserByUserName(name);
		List<Contact> contacts = user.getContacts();*/
		String name = p.getName();
		User user= repo.getUserByUserName(name);
		//current page and size
		Pageable pageable=PageRequest.of(page, 5);
		Page<Contact> findContactByUser = crepo.findContactByUser(user.getId(),pageable);
		m.addAttribute("contacts", findContactByUser);
		m.addAttribute("currentPage", page);
		m.addAttribute("totalPage", findContactByUser.getTotalPages());
		return "normal/show_contact";
	}

	//show particular details.
	@GetMapping("/contact/{cId}")
	public String showContactDetails(@PathVariable("cId")Integer cid,Model m,Principal p) {
		System.out.println("Id "+cid);
		Optional<Contact> contactoptional = crepo.findById(cid);
		Contact contact = contactoptional.get();
		String name = p.getName();
		User user = repo.getUserByUserName(name);

		if(user.getId()==contact.getUser().getId()) {
			m.addAttribute("title", contact.getFirstName());
			m.addAttribute("contact", contact);
		}
		return "normal/contact_details";
	}
	@GetMapping("/profile")
	public String showProfil(Model m) {
		m.addAttribute("title", "User Profil Page");
		return "normal/profile";
	}

	//delete
	@GetMapping("/delete/{cId}")
	public String deleteContact(@PathVariable("cId")Integer cid,Principal p,HttpSession session) {
		Optional<Contact> contactOptional = crepo.findById(cid);
		Contact contact = contactOptional.get();
		String name = p.getName();
		User user = repo.getUserByUserName(name);

		if(user.getId()==contact.getUser().getId()) {
			//contact.setUser(null);

			crepo.delete(contact);
			session.setAttribute("message", new Message("Contact Deleted Successfully", "success"));
			System.out.println("Deleted :"+cid);
		}
		return "redirect:/user/show/0";
	}
	//open update form
	@PostMapping("/edit/{cid}")
	public String editContact(@PathVariable("cid")Integer cid,Model m) {
		m.addAttribute("title", "Update Contact");
		Contact contact = crepo.findById(cid).get();
		m.addAttribute("contact", contact);
		return "normal/update_form";
	}
	//update contact
	@PostMapping("/update")
	public String updateContact(@ModelAttribute("contact")Contact contact,Principal p,@RequestParam("imageProfile") MultipartFile file,Model m,HttpSession session) {
		System.out.println(contact.getFirstName());
		try {
			Contact oldContact= crepo.findById(contact.getCId()).get();

			if(!file.isEmpty()) {
				//file
				//delete old photo
				File delete = new ClassPathResource("static/images").getFile();
				System.out.println("Deleted path :"+delete);
				File f1=new File(delete,oldContact.getImage());
				f1.delete();
				//update photo
				File f = new ClassPathResource("static/images").getFile();
				Path path = Paths.get(f.getAbsolutePath()+File.separator+file.getOriginalFilename());
				Files.copy(file.getInputStream(),path , StandardCopyOption.REPLACE_EXISTING);
				contact.setImage(file.getOriginalFilename());

			}
			else {
				contact.setImage(oldContact.getImage());
			}
			User user = repo.getUserByUserName(p.getName());
			contact.setUser(user);
			crepo.save(contact);
			session.setAttribute("message", new Message("Your Contact is updated..","success"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/contact/"+contact.getCId();
	}
}
