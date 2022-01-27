package com.nt.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.MyOrder;

public interface OrderRepo extends JpaRepository<MyOrder, Long>{
	public MyOrder findByOrderId(String orderId);

}
