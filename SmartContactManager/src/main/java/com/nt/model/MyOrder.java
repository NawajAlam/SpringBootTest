package com.nt.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;
@Data
@Entity
public class MyOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long myId;
	private String orderId;
	private Integer amount;
	private String receipt;
	private String status;
	private String paymentId;
	private String date;
	
	 @ManyToOne
	 private User user;
	 
	
}
