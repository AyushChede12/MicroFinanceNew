package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.microfinance.model.CreateLendingGroup;



public interface CreateLendingGroupRepo extends JpaRepository<CreateLendingGroup,Long> {
	 @Query("select coalesce(max(id), 0) from CreateLendingGroup")
	    long getMaxId();
	

}
