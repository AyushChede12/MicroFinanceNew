package com.microfinance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.TeamMember;

public interface TeamMemberRepo extends JpaRepository<TeamMember, Long> {

	List<TeamMember> findByteamMemberCode(String teamMemberCode);


	
}
