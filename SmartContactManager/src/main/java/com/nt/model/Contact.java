package com.nt.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Contact {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cId;
	@NotBlank(message="Name should not be blank")
	private String firstName;
	private String lastName;
	private String work;
	@Email
	private String email;
	@NotBlank(message="Phone Number should not be blank")
	private String phone;
	private String image;
	private String description;
	
	@ManyToOne
	private User user;
	
}
