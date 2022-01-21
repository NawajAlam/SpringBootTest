package com.nt.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nt.model.User;

public interface UserRepo extends JpaRepository<User, Integer>{
	@Query("Select u From User u Where u.email=:email")
	public User getUserByUserName(@Param("email")String email);

}
