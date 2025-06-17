package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.TeamMember;

public interface TeamMemberRepo extends JpaRepository<TeamMember, Long> {


	
}
