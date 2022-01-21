package com.nt.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nt.model.Contact;

public interface ContactRepo extends JpaRepository<Contact, Integer>{

	@Query("From Contact as c Where c.user.id=:id")
	public Page<Contact> findContactByUser(@Param("id")int id,Pageable pageable);
}
